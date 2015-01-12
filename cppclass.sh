#!/bin/bash

# SCAN CLASS PATH
# ===============
CLASS=$1
NAMESPACE_COUNT=0

while true; do
    if [[ $CLASS =~ .*::.* ]]
    then
        NAMESPACES[$NAMESPACE_COUNT]=$(echo $CLASS | sed -r 's/([^:]*)::(.*)/\1/')
        CLASS=$(echo $CLASS | sed -r 's/([^:]*)::(.*)/\2/')
        NAMESPACE_COUNT=$(($NAMESPACE_COUNT + 1))
    else
        break
    fi
done


# HEADER FILE
# ===========

echo -e "#ifndef __${CLASS^^}_H_INCLUDED__" > ${CLASS}.h
echo -e "#define __${CLASS^^}_H_INCLUDED__" >> ${CLASS}.h
echo -e "" >> ${CLASS}.h

for (( i = 0 ; i < ${#NAMESPACES[@]} ; i++ )) do
    echo -e "namespace ${NAMESPACES[$i]} {" >> ${CLASS}.h
done
echo -e "\n" >> ${CLASS}.h

echo -e "class $CLASS {" >> ${CLASS}.h
echo -e "" >> ${CLASS}.h
echo -e "}" >> ${CLASS}.h

echo -e "\n" >> ${CLASS}.h
for (( i = $((NAMESPACE_COUNT)) ; i > 0 ; i-- )) do
    echo -e "} // namespace ${NAMESPACES[$(($i - 1))]}" >> ${CLASS}.h
done
echo -e "" >> ${CLASS}.h
echo -e "#endif // __${CLASS^^}_H_INCLUDED__" >> ${CLASS}.h


# SOURCE FILE
# ===========

echo -e "#include \"${CLASS}.h\"" > ${CLASS}.cpp
echo -e "" >> ${CLASS}.cpp

for (( i = 0 ; i < ${#NAMESPACES[@]} ; i++ )) do
    echo -e "namespace ${NAMESPACES[$i]} {" >> ${CLASS}.cpp
done
echo -e "\n" >> ${CLASS}.cpp

echo -e "class $CLASS {" >> ${CLASS}.cpp
echo -e "" >> ${CLASS}.cpp
echo -e "}" >> ${CLASS}.cpp

echo -e "\n" >> ${CLASS}.cpp
for (( i = $((NAMESPACE_COUNT)) ; i > 0 ; i-- )) do
    echo -e "} // namespace ${NAMESPACES[$(($i - 1))]}" >> ${CLASS}.cpp
done
