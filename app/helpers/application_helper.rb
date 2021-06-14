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
    def end_of_month
        date = @month
        days = date.end_of_month
        days = days.day
    end

    def first_day
        date = @month
        first_day = date.beginning_of_month
    end

    def last_day
        date = @month
        last_day = date.end_of_month
    end
end
