`timescale 1ns / 1ns
`define period              20

`define image_height        224
`define image_width         224
`define IMG_SIZE            224*224*3+54
`define padded_image_height 226
`define padded_image_width  226
`define PADDING_IMG_SIZE    226*226

`define KERNEL_COUNT        64
`define KERNEL_HEIGHT       3
`define KERNEL_WIDTH        3

`define PATH_IMG_IN  "../data/cat224.bmp"
`define PATH_KERNEL1 "../data/conv1_kernel_hex.txt"
`define PATH_KERNEL2 "../data/conv2_kernel_hex.txt"
`define PATH_BIAS1   "../data/conv1_bias_hex.txt"
`define PATH_BIAS2   "../data/conv2_bias_hex.txt"
// `define PATH_SDF     "../gate_level/area/sobel_syn.sdf"


module testbench;
    reg  [7:0] img_data      [0:`IMG_SIZE-1];
    reg  [8:0] padding_img_R [0:`PADDING_IMG_SIZE-1];
    reg  [8:0] padding_img_G [0:`PADDING_IMG_SIZE-1];
    reg  [8:0] padding_img_B [0:`PADDING_IMG_SIZE-1];

    reg  [8:0] padding_layer1_img [0:63][0:`PADDING_IMG_SIZE-1];

    integer img_in;
    integer flag = 0;
    integer layer1_complete = 0;
    integer layer1_img1, layer1_img2, layer1_img3, layer1_img4;
    
    integer img_out_layer1_1,img_out_layer1_2,img_out_layer1_3,img_out_layer1_4;
    integer img_out_layer2_1,img_out_layer2_2,img_out_layer2_3,img_out_layer2_4;

    integer offset;
    integer img_h;
    integer img_w;
    integer i, j, idx, h, w, header, iter;

    reg [8*30-1:0] file_paths_layer1 [63:0];
    reg [8*30-1:0] file_paths_layer2 [63:0];
    
    initial begin : filenames_init
        // Initialize file paths using a loop
        for (i = 0; i < 64; i = i + 1) begin
            file_paths_layer1[i] = {"../output/layer1/", $sformatf("%0d", i+1), ".bmp"};
            file_paths_layer2[i] = {"../output/layer2/", $sformatf("%0d", i+1), ".bmp"};
        end
    end

    /* Data */
    reg signed [15:0] layer1_kernel[0:63][0:2][0:`KERNEL_HEIGHT-1][0:`KERNEL_WIDTH-1];    // 0:R, 1:B, 2:G
    reg signed [15:0] layer2_kernel[0:63][0:63][0:`KERNEL_HEIGHT-1][0:`KERNEL_WIDTH-1];   
    reg signed [15:0] layer1_bias  [0:63];
    reg signed [15:0] layer2_bias  [0:63];

    // wire signed [35:0] layer1_output[0:63][0:`image_height-1][0:`image_width-1];                // select 8 bits: [11:4] => layer1_image, then add a 0 sign bit to each and pad 0s around => layer2_input
    // wire signed [7:0]  layer1_image [0:63][0:`image_height-1][0:`image_width-1];
    // wire signed [8:0]  layer2_input [0:63][0:`padded_image_height-1][0:`padded_image_width-1];
    // wire signed [35:0] layer2_output[0:63][0:`image_height-1][0:`image_width-1];                // select 8 bits: [14:7] => result
    // wire signed [7:0]  layer2_image [0:63][0:`image_height-1][0:`image_width-1];

    /* Data flow */
    wire layer1_enable, layer1_enable1, layer1_enable2, layer1_enable3;
    wire layer2_enable, layer2_enable1, layer2_enable2, layer2_enable3, layer2_enable4;

    wire signed [35:0]  output_feature_map1_pixel_layer1;
    wire signed [35:0]  output_feature_map2_pixel_layer1;
    wire signed [35:0]  output_feature_map3_pixel_layer1;
    wire signed [35:0]  output_feature_map4_pixel_layer1;

    wire signed [35:0]  output_feature_map1_pixel_layer2;
    wire signed [35:0]  output_feature_map2_pixel_layer2;
    wire signed [35:0]  output_feature_map3_pixel_layer2;
    wire signed [35:0]  output_feature_map4_pixel_layer2;

    reg signed [35:0] output_feature_map1_pixel_layer2total[0:224*224-1];
    reg signed [35:0] output_feature_map2_pixel_layer2total[0:224*224-1];
    reg signed [35:0] output_feature_map3_pixel_layer2total[0:224*224-1];
    reg signed [35:0] output_feature_map4_pixel_layer2total[0:224*224-1];

    reg signed [8:0]   channel1_layer1, channel2_layer1, channel3_layer1, channel4_layer1;
    reg signed [8:0]   channel1_layer2, channel2_layer2, channel3_layer2, channel4_layer2;
    reg signed [15:0]  weight111, weight112, weight113, weight114, weight115, weight116, weight117, weight118, weight119,
                       weight121, weight122, weight123, weight124, weight125, weight126, weight127, weight128, weight129,
                       weight131, weight132, weight133, weight134, weight135, weight136, weight137, weight138, weight139,
                       weight141, weight142, weight143, weight144, weight145, weight146, weight147, weight148, weight149,
                       weight211, weight212, weight213, weight214, weight215, weight216, weight217, weight218, weight219,
                       weight221, weight222, weight223, weight224, weight225, weight226, weight227, weight228, weight229,
                       weight231, weight232, weight233, weight234, weight235, weight236, weight237, weight238, weight239,
                       weight241, weight242, weight243, weight244, weight245, weight246, weight247, weight248, weight249,
                       weight311, weight312, weight313, weight314, weight315, weight316, weight317, weight318, weight319,
                       weight321, weight322, weight323, weight324, weight325, weight326, weight327, weight328, weight329,
                       weight331, weight332, weight333, weight334, weight335, weight336, weight337, weight338, weight339,
                       weight341, weight342, weight343, weight344, weight345, weight346, weight347, weight348, weight349,
                       weight411, weight412, weight413, weight414, weight415, weight416, weight417, weight418, weight419,
                       weight421, weight422, weight423, weight424, weight425, weight426, weight427, weight428, weight429,
                       weight431, weight432, weight433, weight434, weight435, weight436, weight437, weight438, weight439,
                       weight441, weight442, weight443, weight444, weight445, weight446, weight447, weight448, weight449;
    
    reg signed [15:0]  bias1, bias2, bias3, bias4;
    reg clk;
    reg rst;

    assign layer1_enable = layer1_enable1 & layer1_enable2 & layer1_enable3;
    assign layer2_enable = layer2_enable1 & layer2_enable2 & layer2_enable3 & layer2_enable4;

    wrapper wrapper_ins(layer1_enable1, layer1_enable2, layer1_enable3, 
                        output_feature_map1_pixel_layer1, output_feature_map2_pixel_layer1, output_feature_map3_pixel_layer1, output_feature_map4_pixel_layer1,
                        layer2_enable1, layer2_enable2, layer2_enable3, layer2_enable4, 
                        output_feature_map1_pixel_layer2, output_feature_map2_pixel_layer2, output_feature_map3_pixel_layer2, output_feature_map4_pixel_layer2,
                                
                        channel1_layer1, channel2_layer1, channel3_layer1, channel4_layer1, 
                        channel1_layer2, channel2_layer2, channel3_layer2, channel4_layer2, 
                        
                        weight111, weight112, weight113, weight114, weight115, weight116, weight117, weight118, weight119,
                        weight121, weight122, weight123, weight124, weight125, weight126, weight127, weight128, weight129,
                        weight131, weight132, weight133, weight134, weight135, weight136, weight137, weight138, weight139, 
                        weight141, weight142, weight143, weight144, weight145, weight146, weight147, weight148, weight149,

                        weight211, weight212, weight213, weight214, weight215, weight216, weight217, weight218, weight219,
                        weight221, weight222, weight223, weight224, weight225, weight226, weight227, weight228, weight229,
                        weight231, weight232, weight233, weight234, weight235, weight236, weight237, weight238, weight239, 
                        weight241, weight242, weight243, weight244, weight245, weight246, weight247, weight248, weight249,

                        weight311, weight312, weight313, weight314, weight315, weight316, weight317, weight318, weight319,
                        weight321, weight322, weight323, weight324, weight325, weight326, weight327, weight328, weight329,
                        weight331, weight332, weight333, weight334, weight335, weight336, weight337, weight338, weight339, 
                        weight341, weight342, weight343, weight344, weight345, weight346, weight347, weight348, weight349,

                        weight411, weight412, weight413, weight414, weight415, weight416, weight417, weight418, weight419,
                        weight421, weight422, weight423, weight424, weight425, weight426, weight427, weight428, weight429,
                        weight431, weight432, weight433, weight434, weight435, weight436, weight437, weight438, weight439, 
                        weight441, weight442, weight443, weight444, weight445, weight446, weight447, weight448, weight449,

                        bias1, bias2, bias3, bias4,

                        clk, rst);
    // conv_layer1 conv_layer1_ins(layer1_enable1, layer1_enable2, layer1_enable3, output_feature_map1_pixel_layer1, output_feature_map2_pixel_layer1, output_feature_map3_pixel_layer1, output_feature_map4_pixel_layer1,
                                
    //                             channel1_layer1, channel2_layer1, channel3_layer1,
                                
    //                             weight111, weight112, weight113, weight114, weight115, weight116, weight117, weight118, weight119,
    //                             weight121, weight122, weight123, weight124, weight125, weight126, weight127, weight128, weight129,
    //                             weight131, weight132, weight133, weight134, weight135, weight136, weight137, weight138, weight139,

    //                             weight211, weight212, weight213, weight214, weight215, weight216, weight217, weight218, weight219,
    //                             weight221, weight222, weight223, weight224, weight225, weight226, weight227, weight228, weight229,
    //                             weight231, weight232, weight233, weight234, weight235, weight236, weight237, weight238, weight239,

    //                             weight311, weight312, weight313, weight314, weight315, weight316, weight317, weight318, weight319,
    //                             weight321, weight322, weight323, weight324, weight325, weight326, weight327, weight328, weight329,
    //                             weight331, weight332, weight333, weight334, weight335, weight336, weight337, weight338, weight339,

    //                             weight411, weight412, weight413, weight414, weight415, weight416, weight417, weight418, weight419,
    //                             weight421, weight422, weight423, weight424, weight425, weight426, weight427, weight428, weight429,
    //                             weight431, weight432, weight433, weight434, weight435, weight436, weight437, weight438, weight439,

    //                             bias1, bias2, bias3, bias4,

    //                             clk, rst);
    // conv_layer2 conv_layer2_ins(layer2_enable1, layer2_enable2, layer2_enable3, layer2_enable4, output_feature_map1_pixel_layer2, output_feature_map2_pixel_layer2, output_feature_map3_pixel_layer2, output_feature_map4_pixel_layer2,
                                
    //                             channel1_layer2, channel2_layer2, channel3_layer2, channel4_layer2,
                                
    //                             weight111, weight112, weight113, weight114, weight115, weight116, weight117, weight118, weight119,
    //                             weight121, weight122, weight123, weight124, weight125, weight126, weight127, weight128, weight129,
    //                             weight131, weight132, weight133, weight134, weight135, weight136, weight137, weight138, weight139, 
    //                             weight141, weight142, weight143, weight144, weight145, weight146, weight147, weight148, weight149,

    //                             weight211, weight212, weight213, weight214, weight215, weight216, weight217, weight218, weight219,
    //                             weight221, weight222, weight223, weight224, weight225, weight226, weight227, weight228, weight229,
    //                             weight231, weight232, weight233, weight234, weight235, weight236, weight237, weight238, weight239, 
    //                             weight241, weight242, weight243, weight244, weight245, weight246, weight247, weight248, weight249,

    //                             weight311, weight312, weight313, weight314, weight315, weight316, weight317, weight318, weight319,
    //                             weight321, weight322, weight323, weight324, weight325, weight326, weight327, weight328, weight329,
    //                             weight331, weight332, weight333, weight334, weight335, weight336, weight337, weight338, weight339, 
    //                             weight341, weight342, weight343, weight344, weight345, weight346, weight347, weight348, weight349,

    //                             weight411, weight412, weight413, weight414, weight415, weight416, weight417, weight418, weight419,
    //                             weight421, weight422, weight423, weight424, weight425, weight426, weight427, weight428, weight429,
    //                             weight431, weight432, weight433, weight434, weight435, weight436, weight437, weight438, weight439, 
    //                             weight441, weight442, weight443, weight444, weight445, weight446, weight447, weight448, weight449,

    //                             bias1, bias2, bias3, bias4,

    //                             clk, rst);                    
    
    /****************************************************************************************************************/
    initial begin : readin_kernel_bias
        // Load kernel1 and bias1
        integer channel, j, k;
        integer kernelfile1, biasfile1, kernelfile2, biasfile2;
        reg [15:0] value;

        kernelfile1 = $fopen(`PATH_KERNEL1, "r");
        if (kernelfile1 == 0) begin
            $display("Error opening kernel file");
            $finish;
        end
        for (i = 0; i < `KERNEL_COUNT; i = i + 1) begin
            for (channel = 0; channel < 3; channel = channel + 1) begin
                for (j = 0; j < `KERNEL_HEIGHT; j = j + 1) begin
                    for (k = 0; k < `KERNEL_WIDTH; k = k + 1) begin
                        if (!$fscanf(kernelfile1, "%h\n", value)) begin
                            $display("Error reading kernel value");
                            $finish;
                        end
                        layer1_kernel[i][channel][j][k] = value;
                    end
                end
            end
        end
        $fclose(kernelfile1);

        biasfile1 = $fopen(`PATH_BIAS1, "r");
        if (biasfile1 == 0) begin
            $display("Error opening bias file");
            $finish;
        end
        for (i = 0; i < `KERNEL_COUNT; i = i + 1) begin
            if (!$fscanf(biasfile1, "%h\n", value)) begin
                $display("Error reading kernel value");
                $finish;
            end
            layer1_bias[i] = value;
        end
        $fclose(biasfile1);

        // Load kernel2 and bias2
        kernelfile2 = $fopen(`PATH_KERNEL2, "r");
        if (kernelfile2 == 0) begin
            $display("Error opening kernel file");
            $finish;
        end
        for (i = 0; i < `KERNEL_COUNT; i = i + 1) begin
            for (channel = 0; channel < 64; channel = channel + 1) begin
                for (j = 0; j < `KERNEL_HEIGHT; j = j + 1) begin
                    for (k = 0; k < `KERNEL_WIDTH; k = k + 1) begin
                        if (!$fscanf(kernelfile2, "%h\n", value)) begin
                            $display("Error reading kernel value");
                            $finish;
                        end
                        layer2_kernel[i][channel][j][k] = value;
                    end
                end
            end
        end
        $fclose(kernelfile2);

        biasfile2 = $fopen(`PATH_BIAS2, "r");
        if (biasfile2 == 0) begin
            $display("Error opening bias file");
            $finish;
        end
        for (i = 0; i < `KERNEL_COUNT; i = i + 1) begin
            if (!$fscanf(biasfile2, "%h\n", value)) begin
                $display("Error reading kernel value");
                $finish;
            end
            layer2_bias[i] = value;
        end
        $fclose(biasfile2);

        flag = flag | 1;
    end
    initial begin : readin_bmp
        // Read BMP file
        img_in = $fopen(`PATH_IMG_IN, "rb");
        if (img_in == 0) begin
            $display("Error opening BMP file");
            $finish;
        end
        $fread(img_data, img_in);

        // Extract image dimensions and offset from header
        img_w =  {img_data[21], img_data[20], img_data[19], img_data[18]};
        img_h =  {img_data[25], img_data[24], img_data[23], img_data[22]};
        offset = {img_data[13], img_data[12], img_data[11], img_data[10]};

        // Initialize padding images to zero
        for (idx = 0; idx < `PADDING_IMG_SIZE; idx = idx + 1) begin
            padding_img_R[idx] = 9'b0;
            padding_img_G[idx] = 9'b0;
            padding_img_B[idx] = 9'b0;
        end

        // Populate padding images with BMP data
        for (h = 0; h < img_h; h = h + 1) begin
            for (w = 0; w < img_w; w = w + 1) begin
                $display("reading layer1 input: %d %d", h,w);
                padding_img_R[h * `padded_image_width + w + `padded_image_width+1] = { 1'b0, img_data[(h * img_w + w) * 3 + offset + 2] };
                padding_img_G[h * `padded_image_width + w + `padded_image_width+1] = { 1'b0, img_data[(h * img_w + w) * 3 + offset + 1] };
                padding_img_B[h * `padded_image_width + w + `padded_image_width+1] = { 1'b0, img_data[(h * img_w + w) * 3 + offset + 0] };
                // $display("%d %d %d %d %d", h, w,padding_img_R[h * `padded_image_width + w + `padded_image_width+1], padding_img_G[h * `padded_image_width + w + `padded_image_width+1], padding_img_B[h * `padded_image_width + w + `padded_image_width+1]);
            end
        end
        $fclose(img_in);

        flag = flag | 2;
    end
    initial begin : readin_layer1bmp
        wait(layer1_complete==1);
        // Read BMP file
        for (i = 0; i < 64; i = i + 1) begin
            img_in = $fopen(file_paths_layer1[i], "rb");
            if (img_in == 0) begin
                $display("Error opening BMP file");
                $finish;
            end

            $fread(img_data, img_in);
            
            img_w =  {img_data[21], img_data[20], img_data[19], img_data[18]};
            img_h =  {img_data[25], img_data[24], img_data[23], img_data[22]};
            offset = {img_data[13], img_data[12], img_data[11], img_data[10]};

            for (idx = 0; idx < `PADDING_IMG_SIZE; idx = idx + 1) begin
                padding_layer1_img[i][idx] = 9'b0;
            end
 
            for (h = 0; h < img_h; h = h + 1) begin
                for (w = 0; w < img_w; w = w + 1) begin
                    $display("reading layer2 input: %d %d %d %b",i, h,w, { 1'b0, img_data[(h * img_w + w) * 3 + offset] });
                    padding_layer1_img[i][h * `padded_image_width + w + `padded_image_width+1] = { 1'b0, img_data[(h * img_w + w) * 3 + offset] };
                    // $display("%d %d %d %d %d", h, w,padding_img_R[h * `padded_image_width + w + `padded_image_width+1], padding_img_G[h * `padded_image_width + w + `padded_image_width+1], padding_img_B[h * `padded_image_width + w + `padded_image_width+1]);
                end
            end
            $fclose(img_in);
        end
        layer1_complete = 2;
    end
    initial begin : main_logic
        wait(flag == 3);
        $display("All files have been successfully loaded. Starting main logic...");
        // for(idx = 0; idx < `PADDING_IMG_SIZE; idx = idx+1) begin
        //     $display("%d %d %d %d", idx, padding_img_R[idx], padding_img_G[idx], padding_img_B[idx]);         
        // end
        clk = 1'b0;
        for(i=0;i<16;i=i+1) begin
            rst = 1'b0;
            #1 rst = 1'b1;
            #1 rst = 1'b0;
            img_out_layer1_1=$fopen(file_paths_layer1[4*i+0],"wb");
            img_out_layer1_2=$fopen(file_paths_layer1[4*i+1],"wb");
            img_out_layer1_3=$fopen(file_paths_layer1[4*i+2],"wb");
            img_out_layer1_4=$fopen(file_paths_layer1[4*i+3],"wb");

            for(header = 0; header < 54; header = header + 1) begin
                $fwrite(img_out_layer1_1, "%c", img_data[header]);
                $fwrite(img_out_layer1_2, "%c", img_data[header]);
                $fwrite(img_out_layer1_3, "%c", img_data[header]);
                $fwrite(img_out_layer1_4, "%c", img_data[header]);
            end

            weight111 <= layer1_kernel[i*4+0][0][0][0];weight112 <= layer1_kernel[i*4+0][0][0][1];weight113 <= layer1_kernel[i*4+0][0][0][2];weight114 <= layer1_kernel[i*4+0][0][1][0];weight115 <= layer1_kernel[i*4+0][0][1][1];weight116 <= layer1_kernel[i*4+0][0][1][2];weight117 <= layer1_kernel[i*4+0][0][2][0];weight118 <= layer1_kernel[i*4+0][0][2][1];weight119 <= layer1_kernel[i*4+0][0][2][2];
            weight121 <= layer1_kernel[i*4+0][2][0][0];weight122 <= layer1_kernel[i*4+0][2][0][1];weight123 <= layer1_kernel[i*4+0][2][0][2];weight124 <= layer1_kernel[i*4+0][2][1][0];weight125 <= layer1_kernel[i*4+0][2][1][1];weight126 <= layer1_kernel[i*4+0][2][1][2];weight127 <= layer1_kernel[i*4+0][2][2][0];weight128 <= layer1_kernel[i*4+0][2][2][1];weight129 <= layer1_kernel[i*4+0][2][2][2];
            weight131 <= layer1_kernel[i*4+0][1][0][0];weight132 <= layer1_kernel[i*4+0][1][0][1];weight133 <= layer1_kernel[i*4+0][1][0][2];weight134 <= layer1_kernel[i*4+0][1][1][0];weight135 <= layer1_kernel[i*4+0][1][1][1];weight136 <= layer1_kernel[i*4+0][1][1][2];weight137 <= layer1_kernel[i*4+0][1][2][0];weight138 <= layer1_kernel[i*4+0][1][2][1];weight139 <= layer1_kernel[i*4+0][1][2][2];
            bias1 <= layer1_bias[i*4+0];

            weight211 <= layer1_kernel[i*4+1][0][0][0];weight212 <= layer1_kernel[i*4+1][0][0][1];weight213 <= layer1_kernel[i*4+1][0][0][2];weight214 <= layer1_kernel[i*4+1][0][1][0];weight215 <= layer1_kernel[i*4+1][0][1][1];weight216 <= layer1_kernel[i*4+1][0][1][2];weight217 <= layer1_kernel[i*4+1][0][2][0];weight218 <= layer1_kernel[i*4+1][0][2][1];weight219 <= layer1_kernel[i*4+1][0][2][2];
            weight221 <= layer1_kernel[i*4+1][2][0][0];weight222 <= layer1_kernel[i*4+1][2][0][1];weight223 <= layer1_kernel[i*4+1][2][0][2];weight224 <= layer1_kernel[i*4+1][2][1][0];weight225 <= layer1_kernel[i*4+1][2][1][1];weight226 <= layer1_kernel[i*4+1][2][1][2];weight227 <= layer1_kernel[i*4+1][2][2][0];weight228 <= layer1_kernel[i*4+1][2][2][1];weight229 <= layer1_kernel[i*4+1][2][2][2];
            weight231 <= layer1_kernel[i*4+1][1][0][0];weight232 <= layer1_kernel[i*4+1][1][0][1];weight233 <= layer1_kernel[i*4+1][1][0][2];weight234 <= layer1_kernel[i*4+1][1][1][0];weight235 <= layer1_kernel[i*4+1][1][1][1];weight236 <= layer1_kernel[i*4+1][1][1][2];weight237 <= layer1_kernel[i*4+1][1][2][0];weight238 <= layer1_kernel[i*4+1][1][2][1];weight239 <= layer1_kernel[i*4+1][1][2][2];
            bias2 <= layer1_bias[i*4+1];

            weight311 <= layer1_kernel[i*4+2][0][0][0];weight312 <= layer1_kernel[i*4+2][0][0][1];weight313 <= layer1_kernel[i*4+2][0][0][2];weight314 <= layer1_kernel[i*4+2][0][1][0];weight315 <= layer1_kernel[i*4+2][0][1][1];weight316 <= layer1_kernel[i*4+2][0][1][2];weight317 <= layer1_kernel[i*4+2][0][2][0];weight318 <= layer1_kernel[i*4+2][0][2][1];weight319 <= layer1_kernel[i*4+2][0][2][2];
            weight321 <= layer1_kernel[i*4+2][2][0][0];weight322 <= layer1_kernel[i*4+2][2][0][1];weight323 <= layer1_kernel[i*4+2][2][0][2];weight324 <= layer1_kernel[i*4+2][2][1][0];weight325 <= layer1_kernel[i*4+2][2][1][1];weight326 <= layer1_kernel[i*4+2][2][1][2];weight327 <= layer1_kernel[i*4+2][2][2][0];weight328 <= layer1_kernel[i*4+2][2][2][1];weight329 <= layer1_kernel[i*4+2][2][2][2];
            weight331 <= layer1_kernel[i*4+2][1][0][0];weight332 <= layer1_kernel[i*4+2][1][0][1];weight333 <= layer1_kernel[i*4+2][1][0][2];weight334 <= layer1_kernel[i*4+2][1][1][0];weight335 <= layer1_kernel[i*4+2][1][1][1];weight336 <= layer1_kernel[i*4+2][1][1][2];weight337 <= layer1_kernel[i*4+2][1][2][0];weight338 <= layer1_kernel[i*4+2][1][2][1];weight339 <= layer1_kernel[i*4+2][1][2][2];
            bias3 <= layer1_bias[i*4+2];

            weight411 <= layer1_kernel[i*4+3][0][0][0];weight412 <= layer1_kernel[i*4+3][0][0][1];weight413 <= layer1_kernel[i*4+3][0][0][2];weight414 <= layer1_kernel[i*4+3][0][1][0];weight415 <= layer1_kernel[i*4+3][0][1][1];weight416 <= layer1_kernel[i*4+3][0][1][2];weight417 <= layer1_kernel[i*4+3][0][2][0];weight418 <= layer1_kernel[i*4+3][0][2][1];weight419 <= layer1_kernel[i*4+3][0][2][2];
            weight421 <= layer1_kernel[i*4+3][2][0][0];weight422 <= layer1_kernel[i*4+3][2][0][1];weight423 <= layer1_kernel[i*4+3][2][0][2];weight424 <= layer1_kernel[i*4+3][2][1][0];weight425 <= layer1_kernel[i*4+3][2][1][1];weight426 <= layer1_kernel[i*4+3][2][1][2];weight427 <= layer1_kernel[i*4+3][2][2][0];weight428 <= layer1_kernel[i*4+3][2][2][1];weight429 <= layer1_kernel[i*4+3][2][2][2];
            weight431 <= layer1_kernel[i*4+3][1][0][0];weight432 <= layer1_kernel[i*4+3][1][0][1];weight433 <= layer1_kernel[i*4+3][1][0][2];weight434 <= layer1_kernel[i*4+3][1][1][0];weight435 <= layer1_kernel[i*4+3][1][1][1];weight436 <= layer1_kernel[i*4+3][1][1][2];weight437 <= layer1_kernel[i*4+3][1][2][0];weight438 <= layer1_kernel[i*4+3][1][2][1];weight439 <= layer1_kernel[i*4+3][1][2][2];
            bias4 <= layer1_bias[i*4+3];

            #(`period)
            for(idx = 0; idx < `PADDING_IMG_SIZE; idx = idx+1) begin
                channel1_layer1 <= padding_img_R[idx];
                channel2_layer1 <= padding_img_G[idx];
                channel3_layer1 <= padding_img_B[idx];
                #(`period);
                //---------------------------------------------------------------
                //Write output data to output file here
                if(layer1_enable==1) begin
                    $display("%02d:%2h %02d:%2h %02d:%2h %02d:%2h", 4*i, output_feature_map1_pixel_layer1,4*i+1, output_feature_map2_pixel_layer1, 4*i+2, output_feature_map3_pixel_layer1, 4*i+3, output_feature_map4_pixel_layer1);
                    $fwrite(img_out_layer1_1, "%c%c%c", output_feature_map1_pixel_layer1[11:4],output_feature_map1_pixel_layer1[11:4],output_feature_map1_pixel_layer1[11:4]); 
                    $fwrite(img_out_layer1_2, "%c%c%c", output_feature_map2_pixel_layer1[11:4],output_feature_map2_pixel_layer1[11:4],output_feature_map2_pixel_layer1[11:4]); 
                    $fwrite(img_out_layer1_3, "%c%c%c", output_feature_map3_pixel_layer1[11:4],output_feature_map3_pixel_layer1[11:4],output_feature_map3_pixel_layer1[11:4]); 
                    $fwrite(img_out_layer1_4, "%c%c%c", output_feature_map4_pixel_layer1[11:4],output_feature_map4_pixel_layer1[11:4],output_feature_map4_pixel_layer1[11:4]); 
                end
                // else    $display("%d error", idx);
                //---------------------------------------------------------------
            end
            #(`period)
            $fclose(img_out_layer1_1);$fclose(img_out_layer1_2);$fclose(img_out_layer1_3);$fclose(img_out_layer1_4);
            
        end

        layer1_complete = 1;
        wait(layer1_complete==2);
        $display("Layer 2:");

        for(i=0;i<16;i=i+1) begin
            rst = 1'b0;
            #1 rst = 1'b1;
            #1 rst = 1'b0;
            img_out_layer2_1=$fopen(file_paths_layer2[4*i+0],"wb");
            img_out_layer2_2=$fopen(file_paths_layer2[4*i+1],"wb");
            img_out_layer2_3=$fopen(file_paths_layer2[4*i+2],"wb");
            img_out_layer2_4=$fopen(file_paths_layer2[4*i+3],"wb");

            for(header = 0; header < 54; header = header + 1) begin
                // $display("%c", img_data[header]);
                $fwrite(img_out_layer2_1, "%c", img_data[header]);
                $fwrite(img_out_layer2_2, "%c", img_data[header]);
                $fwrite(img_out_layer2_3, "%c", img_data[header]);
                $fwrite(img_out_layer2_4, "%c", img_data[header]);
            end
            for(idx = 0; idx < 224*224; idx = idx+1) begin
                output_feature_map1_pixel_layer2total[idx] = 0;
                output_feature_map2_pixel_layer2total[idx] = 0;
                output_feature_map3_pixel_layer2total[idx] = 0;
                output_feature_map4_pixel_layer2total[idx] = 0;
            end
            for(j=0;j<16;j=j+1) begin
                $display("i=%d, j=%d", i,j);
                weight111 <= layer2_kernel[i*4+0][j*4+0][0][0];weight112 <= layer2_kernel[i*4+0][j*4+0][0][1];weight113 <= layer2_kernel[i*4+0][j*4+0][0][2];weight114 <= layer2_kernel[i*4+0][j*4+0][1][0];weight115 <= layer2_kernel[i*4+0][j*4+0][1][1];weight116 <= layer2_kernel[i*4+0][j*4+0][1][2];weight117 <= layer2_kernel[i*4+0][j*4+0][2][0];weight118 <= layer2_kernel[i*4+0][j*4+0][2][1];weight119 <= layer2_kernel[i*4+0][j*4+0][2][2];
                weight121 <= layer2_kernel[i*4+0][j*4+1][0][0];weight122 <= layer2_kernel[i*4+0][j*4+1][0][1];weight123 <= layer2_kernel[i*4+0][j*4+1][0][2];weight124 <= layer2_kernel[i*4+0][j*4+1][1][0];weight125 <= layer2_kernel[i*4+0][j*4+1][1][1];weight126 <= layer2_kernel[i*4+0][j*4+1][1][2];weight127 <= layer2_kernel[i*4+0][j*4+1][2][0];weight128 <= layer2_kernel[i*4+0][j*4+1][2][1];weight129 <= layer2_kernel[i*4+0][j*4+1][2][2];
                weight131 <= layer2_kernel[i*4+0][j*4+2][0][0];weight132 <= layer2_kernel[i*4+0][j*4+2][0][1];weight133 <= layer2_kernel[i*4+0][j*4+2][0][2];weight134 <= layer2_kernel[i*4+0][j*4+2][1][0];weight135 <= layer2_kernel[i*4+0][j*4+2][1][1];weight136 <= layer2_kernel[i*4+0][j*4+2][1][2];weight137 <= layer2_kernel[i*4+0][j*4+2][2][0];weight138 <= layer2_kernel[i*4+0][j*4+2][2][1];weight139 <= layer2_kernel[i*4+0][j*4+2][2][2];
                weight141 <= layer2_kernel[i*4+0][j*4+3][0][0];weight142 <= layer2_kernel[i*4+0][j*4+3][0][1];weight143 <= layer2_kernel[i*4+0][j*4+3][0][2];weight144 <= layer2_kernel[i*4+0][j*4+3][1][0];weight145 <= layer2_kernel[i*4+0][j*4+3][1][1];weight146 <= layer2_kernel[i*4+0][j*4+3][1][2];weight147 <= layer2_kernel[i*4+0][j*4+3][2][0];weight148 <= layer2_kernel[i*4+0][j*4+3][2][1];weight149 <= layer2_kernel[i*4+0][j*4+3][2][2];
                bias1 <= layer2_bias[i*4+0];

                weight211 <= layer2_kernel[i*4+1][j*4+0][0][0];weight212 <= layer2_kernel[i*4+1][j*4+0][0][1];weight213 <= layer2_kernel[i*4+1][j*4+0][0][2];weight214 <= layer2_kernel[i*4+1][j*4+0][1][0];weight215 <= layer2_kernel[i*4+1][j*4+0][1][1];weight216 <= layer2_kernel[i*4+1][j*4+0][1][2];weight217 <= layer2_kernel[i*4+1][j*4+0][2][0];weight218 <= layer2_kernel[i*4+1][j*4+0][2][1];weight219 <= layer2_kernel[i*4+1][j*4+0][2][2];
                weight221 <= layer2_kernel[i*4+1][j*4+1][0][0];weight222 <= layer2_kernel[i*4+1][j*4+1][0][1];weight223 <= layer2_kernel[i*4+1][j*4+1][0][2];weight224 <= layer2_kernel[i*4+1][j*4+1][1][0];weight225 <= layer2_kernel[i*4+1][j*4+1][1][1];weight226 <= layer2_kernel[i*4+1][j*4+1][1][2];weight227 <= layer2_kernel[i*4+1][j*4+1][2][0];weight228 <= layer2_kernel[i*4+1][j*4+1][2][1];weight229 <= layer2_kernel[i*4+1][j*4+1][2][2];
                weight231 <= layer2_kernel[i*4+1][j*4+2][0][0];weight232 <= layer2_kernel[i*4+1][j*4+2][0][1];weight233 <= layer2_kernel[i*4+1][j*4+2][0][2];weight234 <= layer2_kernel[i*4+1][j*4+2][1][0];weight235 <= layer2_kernel[i*4+1][j*4+2][1][1];weight236 <= layer2_kernel[i*4+1][j*4+2][1][2];weight237 <= layer2_kernel[i*4+1][j*4+2][2][0];weight238 <= layer2_kernel[i*4+1][j*4+2][2][1];weight239 <= layer2_kernel[i*4+1][j*4+2][2][2];
                weight241 <= layer2_kernel[i*4+1][j*4+3][0][0];weight242 <= layer2_kernel[i*4+1][j*4+3][0][1];weight243 <= layer2_kernel[i*4+1][j*4+3][0][2];weight244 <= layer2_kernel[i*4+1][j*4+3][1][0];weight245 <= layer2_kernel[i*4+1][j*4+3][1][1];weight246 <= layer2_kernel[i*4+1][j*4+3][1][2];weight247 <= layer2_kernel[i*4+1][j*4+3][2][0];weight248 <= layer2_kernel[i*4+1][j*4+3][2][1];weight249 <= layer2_kernel[i*4+1][j*4+3][2][2];
                bias2 <= layer2_bias[i*4+1];

                weight311 <= layer2_kernel[i*4+2][j*4+0][0][0];weight312 <= layer2_kernel[i*4+2][j*4+0][0][1];weight313 <= layer2_kernel[i*4+2][j*4+0][0][2];weight314 <= layer2_kernel[i*4+2][j*4+0][1][0];weight315 <= layer2_kernel[i*4+2][j*4+0][1][1];weight316 <= layer2_kernel[i*4+2][j*4+0][1][2];weight317 <= layer2_kernel[i*4+2][j*4+0][2][0];weight318 <= layer2_kernel[i*4+2][j*4+0][2][1];weight319 <= layer2_kernel[i*4+2][j*4+0][2][2];
                weight321 <= layer2_kernel[i*4+2][j*4+1][0][0];weight322 <= layer2_kernel[i*4+2][j*4+1][0][1];weight323 <= layer2_kernel[i*4+2][j*4+1][0][2];weight324 <= layer2_kernel[i*4+2][j*4+1][1][0];weight325 <= layer2_kernel[i*4+2][j*4+1][1][1];weight326 <= layer2_kernel[i*4+2][j*4+1][1][2];weight327 <= layer2_kernel[i*4+2][j*4+1][2][0];weight328 <= layer2_kernel[i*4+2][j*4+1][2][1];weight329 <= layer2_kernel[i*4+2][j*4+1][2][2];
                weight331 <= layer2_kernel[i*4+2][j*4+2][0][0];weight332 <= layer2_kernel[i*4+2][j*4+2][0][1];weight333 <= layer2_kernel[i*4+2][j*4+2][0][2];weight334 <= layer2_kernel[i*4+2][j*4+2][1][0];weight335 <= layer2_kernel[i*4+2][j*4+2][1][1];weight336 <= layer2_kernel[i*4+2][j*4+2][1][2];weight337 <= layer2_kernel[i*4+2][j*4+2][2][0];weight338 <= layer2_kernel[i*4+2][j*4+2][2][1];weight339 <= layer2_kernel[i*4+2][j*4+2][2][2];
                weight341 <= layer2_kernel[i*4+2][j*4+3][0][0];weight342 <= layer2_kernel[i*4+2][j*4+3][0][1];weight343 <= layer2_kernel[i*4+2][j*4+3][0][2];weight344 <= layer2_kernel[i*4+2][j*4+3][1][0];weight345 <= layer2_kernel[i*4+2][j*4+3][1][1];weight346 <= layer2_kernel[i*4+2][j*4+3][1][2];weight347 <= layer2_kernel[i*4+2][j*4+3][2][0];weight348 <= layer2_kernel[i*4+2][j*4+3][2][1];weight349 <= layer2_kernel[i*4+2][j*4+3][2][2];
                bias3 <= layer2_bias[i*4+2];

                weight411 <= layer2_kernel[i*4+3][j*4+0][0][0];weight412 <= layer2_kernel[i*4+3][j*4+0][0][1];weight413 <= layer2_kernel[i*4+3][j*4+0][0][2];weight414 <= layer2_kernel[i*4+3][j*4+0][1][0];weight415 <= layer2_kernel[i*4+3][j*4+0][1][1];weight416 <= layer2_kernel[i*4+3][j*4+0][1][2];weight417 <= layer2_kernel[i*4+3][j*4+0][2][0];weight418 <= layer2_kernel[i*4+3][j*4+0][2][1];weight419 <= layer2_kernel[i*4+3][j*4+0][2][2];
                weight421 <= layer2_kernel[i*4+3][j*4+1][0][0];weight422 <= layer2_kernel[i*4+3][j*4+1][0][1];weight423 <= layer2_kernel[i*4+3][j*4+1][0][2];weight424 <= layer2_kernel[i*4+3][j*4+1][1][0];weight425 <= layer2_kernel[i*4+3][j*4+1][1][1];weight426 <= layer2_kernel[i*4+3][j*4+1][1][2];weight427 <= layer2_kernel[i*4+3][j*4+1][2][0];weight428 <= layer2_kernel[i*4+3][j*4+1][2][1];weight429 <= layer2_kernel[i*4+3][j*4+1][2][2];
                weight431 <= layer2_kernel[i*4+3][j*4+2][0][0];weight432 <= layer2_kernel[i*4+3][j*4+2][0][1];weight433 <= layer2_kernel[i*4+3][j*4+2][0][2];weight434 <= layer2_kernel[i*4+3][j*4+2][1][0];weight435 <= layer2_kernel[i*4+3][j*4+2][1][1];weight436 <= layer2_kernel[i*4+3][j*4+2][1][2];weight437 <= layer2_kernel[i*4+3][j*4+2][2][0];weight438 <= layer2_kernel[i*4+3][j*4+2][2][1];weight439 <= layer2_kernel[i*4+3][j*4+2][2][2];
                weight441 <= layer2_kernel[i*4+3][j*4+3][0][0];weight442 <= layer2_kernel[i*4+3][j*4+3][0][1];weight443 <= layer2_kernel[i*4+3][j*4+3][0][2];weight444 <= layer2_kernel[i*4+3][j*4+3][1][0];weight445 <= layer2_kernel[i*4+3][j*4+3][1][1];weight446 <= layer2_kernel[i*4+3][j*4+3][1][2];weight447 <= layer2_kernel[i*4+3][j*4+3][2][0];weight448 <= layer2_kernel[i*4+3][j*4+3][2][1];weight449 <= layer2_kernel[i*4+3][j*4+3][2][2];
                bias4 <= layer2_bias[i*4+3];

                #(`period)
                iter = 0;
                for(idx = 0; idx < `PADDING_IMG_SIZE; idx = idx+1) begin
                    channel1_layer2 <= padding_layer1_img[j*4+0][idx];
                    channel2_layer2 <= padding_layer1_img[j*4+1][idx];
                    channel3_layer2 <= padding_layer1_img[j*4+2][idx];
                    channel4_layer2 <= padding_layer1_img[j*4+3][idx];

                    #(`period);
                    //---------------------------------------------------------------
                    //Write output data to output file here
                    if(layer2_enable==1) begin
                        $display("output_feature_map3_pixel_layer2: %b", output_feature_map3_pixel_layer2);
                        output_feature_map1_pixel_layer2total[iter] = $signed(output_feature_map1_pixel_layer2total[iter]) + $signed(output_feature_map1_pixel_layer2);
                        output_feature_map2_pixel_layer2total[iter] = $signed(output_feature_map2_pixel_layer2total[iter]) + $signed(output_feature_map2_pixel_layer2);
                        output_feature_map3_pixel_layer2total[iter] = $signed(output_feature_map3_pixel_layer2total[iter]) + $signed(output_feature_map3_pixel_layer2);
                        output_feature_map4_pixel_layer2total[iter] = $signed(output_feature_map4_pixel_layer2total[iter]) + $signed(output_feature_map4_pixel_layer2);
                        iter = iter + 1;
                    end
                    // else    $display("%d error", idx);
                    //---------------------------------------------------------------
                end
            end
            for(idx = 0; idx < 224*224; idx = idx+1) begin
                if($signed(output_feature_map1_pixel_layer2total[idx]) + $signed(bias1) > 0) output_feature_map1_pixel_layer2total[idx] = $signed(output_feature_map1_pixel_layer2total[idx]) + $signed(bias1);
                else output_feature_map1_pixel_layer2total[idx] = 0;
                if($signed(output_feature_map2_pixel_layer2total[idx]) + $signed(bias2) > 0) output_feature_map2_pixel_layer2total[idx] = $signed(output_feature_map2_pixel_layer2total[idx]) + $signed(bias2);
                else output_feature_map2_pixel_layer2total[idx] = 0;
                if($signed(output_feature_map3_pixel_layer2total[idx]) + $signed(bias3) > 0) output_feature_map3_pixel_layer2total[idx] = $signed(output_feature_map3_pixel_layer2total[idx]) + $signed(bias3);
                else output_feature_map3_pixel_layer2total[idx] = 0;
                if($signed(output_feature_map4_pixel_layer2total[idx]) + $signed(bias4) > 0) output_feature_map4_pixel_layer2total[idx] = $signed(output_feature_map4_pixel_layer2total[idx]) + $signed(bias4);
                else output_feature_map4_pixel_layer2total[idx] = 0;

                $display("%d %d %d %d %d %b %b %b %b", idx, channel1_layer2, channel2_layer2, channel3_layer2, channel4_layer2, output_feature_map1_pixel_layer2total[idx], output_feature_map2_pixel_layer2total[idx], output_feature_map3_pixel_layer2total[idx], output_feature_map4_pixel_layer2total[idx]);
                $fwrite(img_out_layer2_1, "%c%c%c", output_feature_map1_pixel_layer2total[idx][14:7],output_feature_map1_pixel_layer2total[idx][14:7],output_feature_map1_pixel_layer2total[idx][14:7]); 
                $fwrite(img_out_layer2_2, "%c%c%c", output_feature_map2_pixel_layer2total[idx][14:7],output_feature_map2_pixel_layer2total[idx][14:7],output_feature_map2_pixel_layer2total[idx][14:7]); 
                $fwrite(img_out_layer2_3, "%c%c%c", output_feature_map3_pixel_layer2total[idx][14:7],output_feature_map3_pixel_layer2total[idx][14:7],output_feature_map3_pixel_layer2total[idx][14:7]); 
                $fwrite(img_out_layer2_4, "%c%c%c", output_feature_map4_pixel_layer2total[idx][14:7],output_feature_map4_pixel_layer2total[idx][14:7],output_feature_map4_pixel_layer2total[idx][14:7]);
                
            end
            #(`period)
            $fclose(img_out_layer2_1);$fclose(img_out_layer2_2);$fclose(img_out_layer2_3);$fclose(img_out_layer2_4);
            
        end
        $finish;
    end
    initial begin : rst_init
        rst = 0;
        #1 rst = 1;
        #1 rst = 0;
    end
    always begin : clk_init
		#(`period/2.0) clk <= ~clk;
	end
    // initial begin
	// 	$sdf_annotate (`path_sdf, sobel_ins);
	// end
    // initial begin
    //     $fsdbDumpfile("CNN.fsdb");  // Specify FSDB file
    //     $fsdbDumpvars(0, conv_layer1_ins);  // Dump only top_module signals
    //     // Or limit scope to specific signals
    //     // $fsdbDumpvars(1, top_module.signal1, top_module.signal2);
    //     #1000000;  // Dump for 1,000,000 time units
    //     $dumpoff;  // Stop dumping after this time  
    // end
endmodule