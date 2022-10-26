//--------------------------------------------------------------------------------------
// File: Tutorial04.fx
//
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License (MIT).
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
// Constant Buffer Variables
//--------------------------------------------------------------------------------------
cbuffer ConstantBuffer : register( b0 )
{
	matrix World;
	matrix View;
	matrix Projection;
}

//--------------------------------------------------------------------------------------
struct VS_OUTPUT
{
    float4 Pos : SV_POSITION;
    float4 Color : COLOR0;
};

//--------------------------------------------------------------------------------------
// New Vertex Shader
//--------------------------------------------------------------------------------------
VS_OUTPUT VS(float4 Pos : POSITION, float4 Color : COLOR)
{
    matrix Scaling =
    {
        2, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 5, 0,
        0, 0, 0, 1
    };

    matrix Translation =
    {
        1, 0, 0, 0,
        0, 1, 0, 1,
        0, 0, 1, -1.5f,
        0, 0, 0, 1
    };


    VS_OUTPUT output = (VS_OUTPUT)0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(Translation, output.Pos);
    output.Pos = mul(Scaling, output.Pos);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}

//--------------------------------------------------------------------------------------
// New Vertex Shader
//--------------------------------------------------------------------------------------
VS_OUTPUT VS2(float4 Pos : POSITION, float4 Color : COLOR)
{
    matrix Scaling =
    {
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1
    };

    matrix Translation =
    {
        1, 0, 0, -2.5f,
        0, 1, 0, -2,
        0, 0, 1, -1.5f,
        0, 0, 0, 1
    };


    VS_OUTPUT output = (VS_OUTPUT) 0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(Translation, output.Pos);
    output.Pos = mul(Scaling, output.Pos);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}

//--------------------------------------------------------------------------------------
// New Vertex Shader
//--------------------------------------------------------------------------------------
VS_OUTPUT VS3(float4 Pos : POSITION, float4 Color : COLOR)
{
    matrix Scaling =
    {
        1, 0, 0, 0,
        0, 2, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1
    };

    matrix Translation =
    {
        1, 0, 0, 0,
        0, 1, 0, -1,
        0, 0, 1, 0,
        0, 0, 0, 1
    };


    VS_OUTPUT output = (VS_OUTPUT) 0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(Translation, output.Pos);
    output.Pos = mul(Scaling, output.Pos);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}

//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
float4 PS( VS_OUTPUT input ) : SV_Target
{
    return input.Color;
}
float4 PS2(VS_OUTPUT input) : SV_Target
{
    input.Color.rgba = 0.5f;
    return input.Color;
}
float4 PS3(VS_OUTPUT input) : SV_Target
{
    input.Color.rgba = 0.8f;
    return input.Color;
}
