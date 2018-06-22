package accommodation;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String tag = "attfile1";
		String tag_sub = tag.substring(7, tag.length());
		
		int tag_num = Integer.parseInt(tag_sub);
		
		if (tag_num != 0){
		System.out.println(((tag_num-1)/5)+1);
		}
	}

}
