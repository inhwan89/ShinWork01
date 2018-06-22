package Member;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberMybatisFactory { //DBConn.java의 역할
	private static SqlSessionFactory factory;
	//static형태:최초접속자에의해 초기화되면 두번째 접속자에의해 초기화되지 않음. 초기화되지는 않지만 값을 바꿀수있음. 값 변경을 원하지 않는다면 final형태
	static{
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis_config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader); //sql 세션을 만들기위한 factory 생성
		} catch (IOException e) {

			e.printStackTrace();
		}		
	}
	public static SqlSessionFactory getFactory() {//factory getter생성
		return factory;
	}
}