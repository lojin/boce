import java.util.ArrayList;


public class T01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		String split = "|";
		run("\\|");
		run("\\Q|");
		run1('|');
		//System.out.println(java.util.regex.Pattern.quote("|"));
	}

	private static void run(String split){
		byte[] buff = "13317276177|0|37440015EC6F|0|204|2017-04-26 21:09:24.8219300|2017-04-26 21:09:25.2357010|414|832|52|884|59|10.135.47.95|17.254.32.16|0|Search%20Framework/1.0 CFNetwork/808.3 Darwin/16.3.0|ctwap@mycdma.cn|460031393235566|172.20.134.117|115.168.86.128|text/xml|49157|80|2|http://wu-calculator.apple.com/dgw?imei=APPLE&apptype=finance|0|wu-calculator.apple.com||64|".getBytes();

		String text = new String(buff);
		StringBuffer t = new StringBuffer(new String(buff));
		long start = System.currentTimeMillis();
		for(int i=1;i<=200000;i++){
			t.setCharAt(0, (char)(48 + (i%64)));
			text = t.toString();
			String[] tmp = text.split(split,0);
			if(i%4321==0){
				//System.out.println(tmp[0]);
			}
		}
		long end = System.currentTimeMillis();
		System.out.println("time consume(ms):" + (end-start));
	
	}
	
	private static void run1(char split){
		byte[] buff = "13317276177|0|37440015EC6F|0|204|2017-04-26 21:09:24.8219300|2017-04-26 21:09:25.2357010|414|832|52|884|59|10.135.47.95|17.254.32.16|0|Search%20Framework/1.0 CFNetwork/808.3 Darwin/16.3.0|ctwap@mycdma.cn|460031393235566|172.20.134.117|115.168.86.128|text/xml|49157|80|2|http://wu-calculator.apple.com/dgw?imei=APPLE&apptype=finance|0|wu-calculator.apple.com||64|".getBytes();

		//org.apache.hadoop.util.StringUtils.split("",',');
		String text = new String(buff);
		StringBuffer t = new StringBuffer(new String(buff));
		long start = System.currentTimeMillis();
		for(int i=1;i<=200000;i++){
			t.setCharAt(0, (char)(48 + (i%64)));
			text = t.toString();
			//org.apache.hadoop.util.StringUtils.split(str, separator);
			//String[] tmp = org.apache.hadoop.util.StringUtils.split(text,split);
			String[] tmp = split(text,split);
			if(i%4321==0){
				//System.out.println(tmp[0]);
			}
		}
		long end = System.currentTimeMillis();
		System.out.println("time consume(ms):" + (end-start));
	
	}
	
	public static String[] split2(String str, char separator) {
		if (str==null) {
			return null;
		}
		ArrayList<String> strList = new ArrayList<String>();
		int beginPos = 0;
		byte[] buff = str.getBytes(); 
		for (int i = 0; i < buff.length; i++) {
			byte curChar = buff[i];
			if (curChar == separator) { // separator 
				String sTmp = new String(buff,beginPos,i-beginPos);
				strList.add(sTmp);
				beginPos = i+1;
			}
		}
		try{
		String sTmp = new String(buff,beginPos,buff.length-beginPos);
		strList.add(sTmp);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return strList.toArray(new String[strList.size()]);
	}	
	public static String[] split(
			String str, char separator) {
		// String.split returns a single empty result for splitting the empty
		if (str==null) return null;
		if (str.isEmpty()) {
			return new String[]{""};
		}
		ArrayList<String> strList = new ArrayList<String>();
		int startIndex = 0;
		int nextIndex = 0;
		while ((nextIndex = str.indexOf(separator, startIndex)) != -1) {
			strList.add(str.substring(startIndex, nextIndex));
			startIndex = nextIndex + 1;
		}
		strList.add(str.substring(startIndex));
		// remove trailing empty split(s)
		int last = strList.size(); // last split
		while (--last>=0 && "".equals(strList.get(last))) {
			strList.remove(last);
		}
		return strList.toArray(new String[strList.size()]);
	}
}
