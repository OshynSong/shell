#
#!/usr/bin
#
########################################################
#Filename: compreee-js.sh
#Author  : Oshyn Song <dualyangsong@gmail.com>
#Time    : 2014-8-19
#Desc    : compress the javascript file by basic method
########################################################

if [ $# -ne 1 ];
then
  echo "Usage: sh $0 js-filename";
  exit;
fi

jsfile=$1;

echo "Compress $jsfile start ...";

time -a \
  cat -s $jsfile      | \
  sed 's!//.*$!!g'    | \
  tr -d '\n\t'        | \
  tr -s ' '           | \
  sed 's!/\*.*\*/!!g' | \
  sed 's! \?\([+=\!&%$\*\|><{}();,:]\) \?!\1!g'  >  "compress.${jsfile}";

echo "process finished.";
