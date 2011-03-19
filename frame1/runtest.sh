
cc -g -I ../../libdwarf -L ../../libdwarf frame1.c -ldwarf -lelf -o frame1
if [ $? -ne 0 ]
then
    echo FAIL building frame1.c
    exit 1
fi
./frame1 frame1.orig >frame1.out
if [ $? -ne 0 ]
then
    echo FAIL running frame1.c
    exit 1
fi
diff frame1.base frame1.out >diffs
if [ $? -ne 0 ]
then
    echo "FAIL frame1 test.  got diffs in output."
    cat diffs
    exit 1
fi
echo PASS frame1/runtest.sh
rm -f junk
rm -f frame1.out
rm -f diffs
rm -f frame1
exit 0
