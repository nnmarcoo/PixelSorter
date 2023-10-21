#pragma once
#include "wx/wx.h"

class TextSlider : wxStaticText {
public:
    TextSlider(wxWindow* parent, wxWindowID id, const wxString& defaultval, int minval, int maxval);
private:
    DECLARE_EVENT_TABLE()

    void OnMouseLeftDown(wxMouseEvent& e);

    int val_;
    int min_;
    int max_;
    
};