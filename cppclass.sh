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

PATH=""
for (( i = 0 ; i < ${#NAMESPACES[@]} ; i++ )) do
	PATH="$PATH${NAMESPACES[$i]}/"
done

SRCPATH=src/${PATH}${CLASS}.cpp
HEADERPATH=includes/${PATH}${CLASS}.hpp


# HEADER FILE
# ===========

echo -e "#ifndef __${CLASS^^}_H_INCLUDED__" > ${HEADERPATH}
echo -e "#define __${CLASS^^}_H_INCLUDED__" >> ${HEADERPATH}
echo -e "" >> ${HEADERPATH}

if [ $NAMESPACE_COUNT -gt 0 ]
then
    for (( i = 0 ; i < ${#NAMESPACES[@]} ; i++ )) do
        echo -e "namespace ${NAMESPACES[$i]} {" >> ${HEADERPATH}
    done
    echo -e "\n" >> ${HEADERPATH}
fi

echo -e "class $CLASS" >> ${HEADERPATH}
echo -e "{" >> ${HEADERPATH}
echo -e "public:" >> ${HEADERPATH}
echo -e "    $CLASS() = default;" >> ${HEADERPATH}
echo -e "    ~$CLASS() = default;" >> ${HEADERPATH}
echo -e "" >> ${HEADERPATH}
echo -e "};" >> ${HEADERPATH}

if [ $NAMESPACE_COUNT -gt 0 ]
then
    echo -e "\n" >> ${HEADERPATH}
    for (( i = $((NAMESPACE_COUNT)) ; i > 0 ; i-- )) do
        echo -e "} // namespace ${NAMESPACES[$(($i - 1))]}" >> ${HEADERPATH}
    done
fi

echo -e "" >> ${HEADERPATH}
echo -e "#endif // __${CLASS^^}_H_INCLUDED__" >> ${HEADERPATH}


# SOURCE FILE
# ===========

echo -e "#include \"${PATH}${CLASS}.hpp\"" > ${SRCPATH}
echo -e "" >> ${SRCPATH}

if [ $NAMESPACE_COUNT -gt 0 ]
then
    for (( i = 0 ; i < ${#NAMESPACES[@]} ; i++ )) do
        echo -e "namespace ${NAMESPACES[$i]} {" >> ${SRCPATH}
    done
    echo -e "\n" >> ${SRCPATH}
fi

if [ $NAMESPACE_COUNT -gt 0 ]
then
    echo -e "\n" >> ${SRCPATH}
    for (( i = $((NAMESPACE_COUNT)) ; i > 0 ; i-- )) do
        echo -e "} // namespace ${NAMESPACES[$(($i - 1))]}" >> ${SRCPATH}
    done
fi
