module ApplicationHelper
    def text_color(v)
        if v == "あり"
            "text_color"
        end
    end
    def text_color_temp(temp)
        if 36.9 < temp
            "text_color"
        end
    end
end
