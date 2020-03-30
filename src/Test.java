import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Test {
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		Date d = new Date();
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		System.out.println(df.format(d));
	}
}
