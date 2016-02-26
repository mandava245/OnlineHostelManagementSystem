package connect;
public class ConnectFactory{
	public static Connect getConnToDB(String name){
		if(name.equalsIgnoreCase("Oracle")){
			return new OracleConnect();
		}
		else if(name.equalsIgnoreCase("MySQL")){
			return new MySQLConnect();
		}
		else{
			return null;
		}
	}
}