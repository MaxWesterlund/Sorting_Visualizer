require 'ruby2d'

def generate_array(size, max)
    arr = [size]
    i = 0
    while i < size
        arr[i] = rand(0..max)
        i += 1
    end
    return arr
end

def draw_array(rects, arr, max, index)
    i = 0
    while i < arr.length
        rect = rects[i]
    
        h = get :height
        w = get :width
    
        rect.x = i * (w / arr.length)
        rect.y = h - (arr[i] / max.to_f) * h
    
        rect.width = w / arr.length
        rect.height = (arr[i] / max.to_f) * h
        
        if i == index
            rect.color = 'red'
        else
            rect.color = 'white'
        end
    
        i += 1
    end
end

def bubble_sort!(arr, index, is_sorted)
    if (arr[index] > arr[index + 1])
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        is_sorted = false
    end
end

max = 100
size = 640

rects = [size]

i = 0
while i < size
    rects[i] = Rectangle.new
    i += 1
end

arr = generate_array(size, max)

is_sorted = false

i = 0

update do
    if !is_sorted
        if i < arr.length - 1
            bubble_sort!(arr, i, is_sorted)
            draw_array(rects, arr, max, i)
            i += 1
        else
            i = 0
        end
    end
end

show