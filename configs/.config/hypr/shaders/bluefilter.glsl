#version 300 es

precision mediump float;
in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {

    vec4 pixColor = texture(tex, v_texcoord);

    // green
    pixColor[1] *= 0.855;

    // blue
    pixColor[2] *= 0.725;

    fragColor = pixColor;
}
