module conv_layer2(
    output wire enable1, enable2, enable3, enable4,
    output wire signed [35:0] output_feature_map1_pixel,
    output wire signed [35:0] output_feature_map2_pixel,
    output wire signed [35:0] output_feature_map3_pixel,
    output wire signed [35:0] output_feature_map4_pixel,
    
    input wire signed [8:0] channel1,
    input wire signed [8:0] channel2,
    input wire signed [8:0] channel3,
    input wire signed [8:0] channel4,
//     input wire signed [8:0] channel4,

    input wire signed [15:0] weight111, weight112, weight113, weight114, weight115, weight116, weight117, weight118, weight119,
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

    input wire signed [15:0] bias1, bias2, bias3, bias4,
    
    input wire clk,
    input wire rst
);

        wire signed[8:0] buf_out11, buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19,
                         buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29,
                         buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39,
                         buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49;
        
        line_buffer line_buffer_1(buf_out11, buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19, enable1, channel1, clk, rst);
        line_buffer line_buffer_2(buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29, enable2, channel2, clk, rst);
        line_buffer line_buffer_3(buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39, enable3, channel3, clk, rst);
        line_buffer line_buffer_4(buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49, enable4, channel4, clk, rst);
        

        wire signed [35:0] PE_out1, PE_out2, PE_out3, PE_out4;
        PE_layer2 PE_1(PE_out1, bias1,
                buf_out11, buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19,
                buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29,
                buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39,
                buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49,
                weight111, weight112, weight113, weight114, weight115, weight116, weight117, weight118, weight119,
                weight121, weight122, weight123, weight124, weight125, weight126, weight127, weight128, weight129,
                weight131, weight132, weight133, weight134, weight135, weight136, weight137, weight138, weight139,
                weight141, weight142, weight143, weight144, weight145, weight146, weight147, weight148, weight149
                );
        PE_layer2 PE_2(PE_out2, bias2,
                buf_out11, buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19,
                buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29,
                buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39,
                buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49,
                weight211, weight212, weight213, weight214, weight215, weight216, weight217, weight218, weight219,
                weight221, weight222, weight223, weight224, weight225, weight226, weight227, weight228, weight229,
                weight231, weight232, weight233, weight234, weight235, weight236, weight237, weight238, weight239,
                weight241, weight242, weight243, weight244, weight245, weight246, weight247, weight248, weight249
                );
        PE_layer2 PE_3(PE_out3, bias3,
                buf_out11, buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19,
                buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29,
                buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39,
                buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49,
                weight311, weight312, weight313, weight314, weight315, weight316, weight317, weight318, weight319,
                weight321, weight322, weight323, weight324, weight325, weight326, weight327, weight328, weight329,
                weight331, weight332, weight333, weight334, weight335, weight336, weight337, weight338, weight339,
                weight341, weight342, weight343, weight344, weight345, weight346, weight347, weight348, weight349
                );
        PE_layer2 PE_4(PE_out4, bias4,
                buf_out11, buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19,
                buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29,
                buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39,
                buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49,
                weight411, weight412, weight413, weight414, weight415, weight416, weight417, weight418, weight419,
                weight421, weight422, weight423, weight424, weight425, weight426, weight427, weight428, weight429,
                weight431, weight432, weight433, weight434, weight435, weight436, weight437, weight438, weight439,
                weight441, weight442, weight443, weight444, weight445, weight446, weight447, weight448, weight449
                );
        
        assign output_feature_map1_pixel = (rst==1) ? 0:PE_out1;
        assign output_feature_map2_pixel = (rst==1) ? 0:PE_out2;
        assign output_feature_map3_pixel = (rst==1) ? 0:PE_out3;
        assign output_feature_map4_pixel = (rst==1) ? 0:PE_out4;
        // assign output_feature_map1_pixel = PE_out1;
        // assign output_feature_map2_pixel = PE_out2;
        // assign output_feature_map3_pixel = PE_out3;
        // assign output_feature_map4_pixel = PE_out4;
endmodule