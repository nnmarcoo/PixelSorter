#pragma once

// Holds 
class VertexBuffer { // vbo
public:
    VertexBuffer(const void* data, unsigned int size);
    VertexBuffer() = default;
    ~VertexBuffer();
    
    void Bind() const;
    void Unbind() const;

private:
    unsigned int RendererID_;
};
