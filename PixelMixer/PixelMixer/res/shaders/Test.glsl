#shader vertex
#version 330 core

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord;

out vec2 v_TexCoord;

uniform mat4 u_MVP;

void main() {
   gl_Position = u_MVP * position;
   v_TexCoord = texCoord;
}





#shader fragment
#version 330 core

layout(location = 0) out vec4 color;

in vec2 v_TexCoord;
uniform sampler2D u_Texture;

uniform float u_Threshold;

float Lum(vec4 color) { // Get luminance of color
    return dot(color.rgb, vec3(0.299, 0.587, 0.114));
}

float Average(vec4 color) { // Get average of R G B of color
    return (color.r + color.g + color.b) / 3;
}

void main() {
    vec4 texColor = texture(u_Texture, v_TexCoord);
    float luminance = Lum(texColor);

    vec4 outColor;
    if (luminance > u_Threshold) {
        outColor = vec4(1.0);
    } else {
        outColor = vec4(0.0);
    }
    outColor.a = texColor.a;
    gl_FragColor = mix(texColor, outColor, texColor.a);
}

