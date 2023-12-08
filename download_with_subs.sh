#!/usr/bin/bash
a(){
        g=$(printf "%02d" $a)
        h=$(printf "%02d" $b)
        i=$(printf "%02d" $c)
        j=$(printf "%02d" $d)
        k=$(printf "%05d" $e)
        l=$(printf "%08x" $e)
}
b(){
        wget -T 15 -O 202312$g"T"$h$i$j.ts "http://81.211.33.66/hls-live2/streams/1tv-orbit-plus-4/1tv-orbit-plus-45-202312"$g"T"$h$i$j"-TFrag_"$k".ts"
}
c(){
        let d=d+$1
        if(($d>=60));then
                let d=d-60
                let c=c+1
                if(($c>=60));then
                        let c=c-60
                        let b=b+1
                        if(($b>=24));then
                                let b=b-24
                                let a=a+1
                        fi
                fi
        fi
}
d(){
        let d=d-$1
        if(($d<0));then
                let d=d+60
                let c=c-1
                if(($c<0));then
                        let c=c+60
                        let b=b-1
                        if(($b<0));then
                                let b=b+24
                                let a=a-1
                        fi
                fi
        fi
}
e(){
        let p=e%20
        if(($p==0));then
                let q=e-20
                if(! xxd -p "K143"$q"5.key");then
                        while true
                        do
                                wget -T 15 "http://81.211.33.66/hls-live2/keys/1tv-orbit-plus-4/-TFrag/K143"$q"5.key"&&break
                        done
                fi
                r=$(xxd -p "K143"$q"5.key")
                openssl enc -aes-128-cbc -d -K $r -iv $m$m$m$l -in 202312$g"T"$h$i$j.ts -out 202312$g"T"$h$i$j.mp4&&rm 202312$g"T"$h$i$j.ts
        else
                let q=e-p
                if(! xxd -p "K143"$q"5.key");then
                        while true
                        do
                                wget -T 15 "http://81.211.33.66/hls-live2/keys/1tv-orbit-plus-4/-TFrag/K143"$q"5.key"&&break
                        done
                fi
                r=$(xxd -p "K143"$q"5.key")
                openssl enc -aes-128-cbc -d -K $r -iv $m$m$m$l -in 202312$g"T"$h$i$j.ts -out 202312$g"T"$h$i$j.mp4&&rm 202312$g"T"$h$i$j.ts
        fi
}
f(){
        wget -T 15 -O 202312$g"T"$h$i$j.vtt "http://81.211.33.66/hls-live2/streams/1tv-orbit-plus-4/1tv-orbit-plus-420-202312"$g"T"$h$i$j"-TFrag_"$k".vtt"
}
a=${1#0}
b=${2#0}
c=${3#0}
d=${4#0}
m=00000000
for f in {1..4}
do
        e=${5#0}
done
while true
do
        a
        if(! b);then
                sleep 30
                if(! b);then
                        d 10
                        a
                        for o in {1..40}
                        do
                                if(b);then
                                        f
                                        e
                                        let e=e+1
                                        c 10
                                        a
                                        sleep 30
                                        if(b);then
                                                f
                                                e
                                                let e=e+1
                                                c 10
                                                break
                                        else
                                                d 10
                                                a
                                        fi
                                else
                                        c 1
                                        a
                                        if(($o==40));then
                                                exit
                                        fi
                                fi
                        done
                else
                        f
                        e
                        let e=e+1
                        c 10
                fi
        else
                f
                e
                let e=e+1
                c 10
        fi
done
