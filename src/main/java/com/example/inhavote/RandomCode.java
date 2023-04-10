package com.example.inhavote;

import java.util.Random;

public class RandomCode  {
    public static String randomCode(){
        Random rnd =new Random();

        StringBuffer buf =new StringBuffer();

        for(int i=0;i<6;i++){
            if(rnd.nextBoolean()){
                buf.append((char)((int)(rnd.nextInt(26))+65));
            }else{
                buf.append((rnd.nextInt(10)));
            }
        }
        return buf.toString();
    }
}
