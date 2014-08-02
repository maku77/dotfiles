// [2010-05-10]
//
// Show all system properties.
//
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

public class DumpSystemProperties {
    public static void main(String[] args) {
        Properties props = System.getProperties();

        // System properties can be listed by props.list(System.out)
        // but we would like to sort by their key names.
        List<String> keys = GetSortedKeys(props);
        for (String key : keys) {
            System.out.println(key + " = " + props.getProperty(key));
        }
    }

    public static List<String> GetSortedKeys(Properties props) {
        List<String> keys = new ArrayList<String>();
        Enumeration e = props.propertyNames();
        while (e.hasMoreElements()) {
            String key = (String) e.nextElement();
            keys.add(key);
        }
        Collections.sort(keys);
        return keys;
    }
}

