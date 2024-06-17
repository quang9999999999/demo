#!/bin/bash

echo "Hello world"

data=$(curl -s -L "https://script.google.com/macros/s/AKfycbzUVI9O2fmOJPujQLjZ-jvyjem0r0WhQru5Y8tpS0hWyihpkFKULADAENsI-oneCDbpGg/exec?startPage=1&pageSize=5")

# data1= $(echo "$data" | jq '.[]')
# echo "$data1"

# for ((i=0; i<${#data[@]}; i++)); do
#  echo "object="${objects[$i]}""

#   # Lấy thông tin từ mỗi đối tượng trong $object
#   # ...

#   # Thực hiện hành động với mỗi đối tượng
#   # ...
# done

for item in $(echo "$data" | jq '.[]'); do
  # Lấy thông tin từ mỗi đối tượng trong $item
  id=$(jq '.id' <<< "$item")
  name=$(jq '.nam' <<< "$item")
  age=$(jq '.age' <<< "$item")

  # In thông tin ra màn hình hoặc sử dụng cho mục đích khác
  echo "ID: $id, Tên: $name, Tuổi: $age"
done

# for object in "${data[@]}"; do
#   echo "Object: $object"
# done

  # for row in "${data1[@]}"; do
  # # id=$(jq get id <<< $row)
  # # name=$(jq get nam <<< $row)
  # # age=$(jq get age <<< $row)
  # echo "Row: $row"

  # done

# Chuyển đổi chuỗi JSON trong biến `data` sang định dạng phù hợp cho jq
# jq . <<< "$data" | for row in .[]; do
#   echo "Row: $row"
#   # Lấy thông tin từ mỗi đối tượng trong $row
#   id=$(jq '.id' <<< $row)
#   name=$(jq '.nam' <<< $row)
#   age=$(jq '.age' <<< $row)

#   # In thông tin ra màn hình hoặc sử dụng cho mục đích khác
#   echo "ID: $id, Tên: $name, Tuổi: $age"
# done

# target_folder="/Users/qsoft27/development/test/demo_git_hub_ci_cd/assets/localize"
# if [ ! -f "$target_folder" ]; then
#   mkdir -p "$target_folder"

#   for row in $(echo "$data" | jq -r '.[]'); do
#   touch "$target_folder/new_file.json"
#   echo "Row: $row"
#   echo "$row" > "$target_folder/new_file.json"
#   done

# fi
