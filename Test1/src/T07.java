import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class T07 {

	public static void main(String[] args) throws IOException {
		/*
(Nokia)[\s-]*((?:(?:(?:[a-zA-Z\d]+[\.-]){1,20})?[a-zA-Z\d]+){0,50})[\s/-]|(Android)[\s;]+?([\d\.]{1,10})[\s;]+?((?:TA)(?:[\s\-]+)?(?:[a-zA-Z\d]{1,20}))
paopao;android8.1.0;hmd global;nokia x5cengliagmcaaeckndlibkndhacjpnlemdkejagihfglhdcjeeelpfpebc@天气_5.1.76;a000

(Nokia)[\s-]*((?:(?:(?:[a-zA-Z\d]+[\.-]){1,20})?[a-zA-Z\d]+){0,50})[\s/-]|(Android)[\s;]+?([\d\.]{1,10})[\s;]+?((?:TA)(?:[\s\-]+)?(?:[a-zA-Z\d]{1,20}))
paopao;android8.1.0;hmd global;nokia x5cengliagmcaaeckndlibkndhacjpnlemdkejagihfglhdcjeeelpfpebc@天气_5.1.76;a000
		 */

		//String p = "(Nokia)[\\s-]*((?:(?:(?:[a-zA-Z\\d]+[\\.-]){1,20})?[a-zA-Z\\d]+){0,50})[\\s/-]|(Android)[\\s;]+?([\\d\\.]{1,10})[\\s;]+?((?:TA)(?:[\\s\\-]+)?(?:[a-zA-Z\\d]{1,20}))";
		String p = "(Nokia)[\\s-]*((?:(?:(?:[a-zA-Z\\d]+[\\.-]){1,20})?[a-zA-Z\\d]+){0,50})[\\s/-]|(Android)([\\d\\.]{1,10})[\\s;]+?((?:TA)(?:[\\s\\-]+)?(?:[a-zA-Z\\d]{1,20}))";
		String text = "paopao;android8.1.0;hmd global;nokia x5cengliagmcaaeckndlibkndhacjpnlemdkejagihfglhdcjeeelpfpebc@天气_5.1.76;a000";

//		FileInputStream in = null;
//		byte[] buff = new byte[8192];
//		int len;
//		File file;
//		
//		file = new File("pattern.dump.txt");
//		if(file.exists()){
//			System.out.println("reading pattern from " + file.getAbsolutePath() + " ...");
//			in = new FileInputStream(file);
//			len = in.read(buff);
//			p = new String(buff,0,len,"UTF-8");
//			in.close();
//		}
//		
//		file = new File("text.dump.txt");
//		if(file.exists()){
//			System.out.println("reading text from " + file.getAbsolutePath() + " ...");
//			in = new FileInputStream(file);
//			len = in.read(buff);
//			text = new String(buff,0,len,"UTF-8");
//			in.close();
//		}
//		
//		
		Pattern p1 = Pattern.compile(p,Pattern.CASE_INSENSITIVE);
		Matcher m = p1.matcher(text);
		if(m.find()){
			System.out.println(m.group(2));
		}else{
			System.out.println("Not found!");
		}
		
	}

}
