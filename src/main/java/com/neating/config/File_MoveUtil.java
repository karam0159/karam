package com.neating.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class File_MoveUtil {
									// 경로 포함해서 보낼것 //  경로 포함해서 받을곳(미리폴더만들어있어야함)
	public static void fileMove(String inFileName, String outFileName){
        byte[] buf = new byte[1024];
        FileInputStream fin = null;
        FileOutputStream fout = null;
        
        File file = new File(inFileName);
        if(!file.renameTo(new File(outFileName))){    // renameTo로 이동 실패할 경우
            
            buf = new byte[1024];
            try {
                fin = new FileInputStream(inFileName);
                fout = new FileOutputStream(outFileName);
                int read = 0;
                while((read=fin.read(buf,0,buf.length))!=-1){
                    fout.write(buf, 0, read);
                }
                 
                fin.close();
                fout.close();
                file.delete();                        // 복사 후 파일 삭제
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } 
    }
}
