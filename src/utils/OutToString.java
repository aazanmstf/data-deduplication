package utils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.Charset;

public class OutToString {
	
	
	 public String readInputStream(InputStream inputStream) throws IOException {
	        StringBuilder stringBuilder = new StringBuilder();
	        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream))) {
	            String line;
	            while ((line = bufferedReader.readLine()) != null) {
	                stringBuilder.append(line);
	            }
	        }
	        return stringBuilder.toString();
	    }
	
	
	
	
}

