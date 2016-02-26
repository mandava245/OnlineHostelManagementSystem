package connect;
import java.sql.Connection;
public interface Connect {
	public Connection Connect_DB();
	public void closeConnection();
}
