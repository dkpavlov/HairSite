package com.site.utils;

import com.site.models.Image;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-18
 * Time: 17:09
 */

public class FileUtils {

    public static String BASE_DIR;
    public static String TEST_DIR_WIN = "D:\\Work\\HairSite\\src\\main\\webapp\\storage";
    public static String TEST_DIR_OSX = "/Users/dkpavlov/Desktop/WorkSpace/HairSite/src/main/webapp/storage";
    public static String TEST_DIR_LINUX = "/Users/dkpavlov/Desktop/WorkSpace/HairSite/src/main/webapp/storage";

    static {
        String catalinaBase = System.getProperty("catalina.base");
        if(catalinaBase != null){
            /* TODO */
        } else {
            String osName = System.getProperty("os.name");
            if(osName.startsWith("Windows")){
                BASE_DIR = TEST_DIR_WIN;
            } else if(osName.startsWith("Mac OS X")){
                BASE_DIR = TEST_DIR_OSX;
            } else {
                BASE_DIR = TEST_DIR_LINUX;
            }
        }

    }

    public static Image createImage(MultipartFile file){
        Image image = new Image(storeFile(file));
        if(image.getFileName() != null){
            return image;
        }
        return null;
    }

    public static String storeFile(MultipartFile file){
        if(!file.isEmpty()){
            String filename = (new Date()).getTime() + file.getOriginalFilename();
            Path path = Paths.get(BASE_DIR, filename);
            try {
                Files.write(path, file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
            return filename;
        }
        return null;
    }


}
