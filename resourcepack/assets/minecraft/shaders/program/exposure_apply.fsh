#version 110

uniform sampler2D DiffuseSampler;
uniform sampler2D ExposureSampler;

varying vec2 texCoord;
varying vec2 oneTexel;
varying float aspectRatio;


void main() {
    vec4 OutTexel = texture2D(DiffuseSampler, texCoord);
    float exposure = texture2D(ExposureSampler, vec2(0.5)).r;
    OutTexel.rgb /= 2.0 * clamp(exposure,0.2,1.0);
    OutTexel.rgb = mix(OutTexel.rgb, vec3((OutTexel.r + OutTexel.g + OutTexel.b) / 3.0), clamp(length(OutTexel.rgb) - 0.73205080757, 0.0, 1.0));

    gl_FragColor = OutTexel;
}
