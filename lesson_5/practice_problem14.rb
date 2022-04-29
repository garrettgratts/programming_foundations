#  return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

p = hsh.map do |__, sub_hash|
  if sub_hash[:type] == 'fruit'
    sub_hash[:colors].map {|color| color.capitalize}
  elsif sub_hash[:type] == 'vegetable'
    sub_hash[:size].upcase
  end
end

p p
