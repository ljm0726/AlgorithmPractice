import java.io.*;
import java.util.*;

public class Main {

	public static void main(String[] args) throws Exception{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st;
		
		st = new StringTokenizer(br.readLine());
		
		int n = Integer.parseInt(st.nextToken());
		int m = Integer.parseInt(st.nextToken());
		int[] arr = new int[n];
		
		st = new StringTokenizer(br.readLine());
		for (int i = 0; i < n; i++) {
			arr[i] = Integer.parseInt(st.nextToken());
		}
		
		int start = 0;
		int end = 0;
		
		int sum = 0;
		int ans = 0;
		
		while(start < n) {
			if (sum >= m) {
				sum -= arr[start++];
			} else if(end == n){
				break;
			} else {
				sum += arr[end++];
			}
			
			if(sum == m) ans++;
		}
		
		System.out.println(ans);
	}
}