#include <stdio.h>
#include <math.h>
//#include <string.h>
int charAt(const char *s, char c);
char *stringcopy(char *s1, const char *s2);
char* stringcat(char* s1, const char* s2);
char* Copy(char* s1, const char* s2);
int StrCmp(const char* s1, const char* s2);
//16.���ַ����ĳ��ȡ�  int length(char *s);
int length(const char *s){
	int len=0;
	for(;s[len]!=0; len++);
	return len;
}
//30.��һ���ַ���s���ã���"abcd" ���ú�Ϊ"dcba"�� char *reverse(char *s);
char *reverse(char *s){
	int len = length(s);
	for(int i=0; i<len/2; i++){
		char c=s[i]; s[i]=s[len-1-i]; s[len-1-i]=c;
	}
	return s;
}
//1.��һ������ת��Ϊ�ַ���  void toString(char *s, int num);
char* toString(char *s, int num){
	int i=0;
	while(num){
		s[i++]=num%10+'0';
		num /= 10;
	}
	s[i] = 0;
	reverse(s);
	return s;
} 
//2. ��һ�����������ֵ��ַ���ת��Ϊ���� int str2Int(char *s);
int str2Int(const char *s){
	int i, num=0;
	for(i=0; s[i]!=0; i++){
		num = num*10+(s[i]-'0');
	}
	return num;
}
//3. ��һ���������ֺ�С������ַ���ת��Ϊ���������� double str2lf(char *s);
void split(const char *s, char *s1, char *s2, int pos);
double str2lf(const char *s)
{
	char intPart[10], decPart[20];
	int pos = charAt(s, '.');
	if(pos == -1){
		return str2Int(s);
	}
	split(s, intPart, decPart, charAt(s, '.'));
	double decimal = str2Int(intPart), base=10;
	for(int i=1; decPart[i]!=0; i++){
		decimal += (decPart[i]-'0')/base;
		base *= 10;
	}
	return decimal;
}
//4. ����������������С������ int lcm(int m, int n);
int lcm(int m, int n){
	int k;
	for(k=m>n?m:n; k<=m*n; k++)
	    if(k%m==0 && k%n==0)break;
	return k;	
}
//5. �����������������Լ�� int gcd(int m, int n);
int gcd(int m, int n){
	if(m%n == 0) return n;
	return gcd(n, m%n);
}

int gcd2(int m, int n){
	int k;
	for(k=m<n?m:n; k>0; k--)
	    if(m%k==0 && n%k==0)break;
	return k;	
}
//6. �ж�һ���������Ƿ�Ϊ���� bool isPrime(int num); �� int isPrime(int num);
int isPrime(int num){
	int i, flag=1, m=sqrt(num);
	for(i=2; i<=m; i++)
		if(num%i == 0){
			flag = 0; break;
		}
	return flag;
}
//7. �ж�һ�������Ǽ�λ�� int digits(int num);
int digits(int num){
	int dig=0;
	while(num){
		dig++;
		num /= 10;
	}
	return dig;
}
//8. ��һ��������ת��Ϊʮ�����Ʊ�ʾ���ַ��� void int2Hex(char *hex, int num);
void int2Hex(char *hex, int num){
	int i=0;
	while(num){
		hex[i++] = "0123456789ABCDEF"[num%16];
		num /= 16;
	}
	hex[i] = 0;
	reverse(hex); 
}
void conv(char *str, int num, int b){ //ת��Ϊb������ 
	int i=0; 
	while(num){
		str[i++] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"[num%b];
		num /= b;
	}
	str[i] = 0;
	reverse(str);
}
//9. ��һ��ʮ�����Ʊ�ʾ���ַ���ת��Ϊʮ�������� int hex2Int(char *hex);
int isNumberChar(char c){
	int flag = 0;
	if(c >= '0' && c <= '9') flag = 1;
	return flag;
}
int hex2Int(char *hex)
{
	int i=0, num = 0;
	char c;
	while((c=hex[i]) != '\0'){
		if(isNumberChar(c)) num = num*16+(c-'0');
		else num = num*16+(c-'A'+10);
		i++;
	}
	return num;
}
//10. ��һ��ʮ�������������Ʊ�ʾ�������0���������� 
//�磺���� 1204 ��� 1204=1*1000+2*100+4*1 void int2str(char *s, int num);
char* int2str(char *s, int num){
    int dig = 0;
	char d[10][20];
	int base = 1;
	while(num){
		//dig++;
		int r = num%10;
		if(r != 0){
			char ss[20]; 
			ss[0] = r+'0'; ss[1] = 0;
			stringcat(ss, "*");
			char temp[20];
			toString(temp, base);
			stringcat(ss, temp);
			stringcopy(d[dig++], ss);
		} 
		num /= 10;
		base *= 10;
	}
	int i;
	stringcopy(s, d[dig-1]);
	for(i=dig-2; i>=0; i--){
		stringcat(s, "+");
		stringcat(s, d[i]);
	}
	return s;	
}




//11. ��һ�������������ֺ� int digitsSum(int num);
int digitsSum(int num){
	int sum=0;
	while(num){
		sum += num%10;
		num /= 10;
	}
	return sum;
}
//12. ��һ���������������������������룺1204  �����4021 
int inv(int num){
	char s[20];
	toString(s, num); //�ο���Ŀ1. 
	reverse(s);	//�ο���Ŀ30. 
	return str2Int(s);//�ο���Ŀ2. 
}
//13. ���������������й����ӣ����ع����ӵĸ�����int factors(int *fts, int m, int n);
int commonfactors(int *fts, int m, int n){
	int num=0, i, k=m<n?m:n;
	for(i=1; i<=k; i++){
		if(m%i==0 && n%i==0) fts[num++] = i;
	}
	return num;
} 
//14. ���������������Ӻͣ�����1��������int factorsSum(int m);
int factorsSum(int m){
	int i, sum = 0;
	for(i=2; i<=m/2; i++){
		if(m%i == 0) sum += i;
	}
	return sum;
}



//15. ���һ���������а�������k�ĸ���(kΪ0~9�е���һ����) int numbers(int num, int k);
int numbers(int num, int k){
	int total = 0;
	while(num){
		if(k == num%10) total++;
		num/=10; 
	}
	return total;
}



//17. ���ַ���s2���Ƶ�һ���ַ���s1�С� char *stringcopy(char *s1, const char *s2);
char *stringcopy(char *s1, const char *s2){
	char *p = s1;
	while((*p++=*s2++)!=0);
	return s1;
}
//18. ���ַ���s2���ӵ��ַ���s1�ĺ��档   char *stringcat(char *s1, const char *s2);
char *stringcat(char *s1, const char *s2){
	char *p = s1;
	while(*p)p++;
	while((*p++=*s2++)!=0);
	return s1;
}
//19. ���ַ���s�е����д�д��ĸת��ΪСд��ĸ��   char *stolwr(char *s);
char *stolwr(char *s){
	char *p = s;
	while(*p){
		if(*p >= 'A' && *p <= 'Z') *p += 32;
		p++;
	}
	return s;
}
//20. ���ַ���s�е�����Сд��ĸת��Ϊ��д��ĸ��  char *stoupr(char *s);
char *stoupr(char *s){
	int i;
	for(i=0; s[i]!=0; i++)
		if(s[i] >= 'a' && s[i] <= 'z') s[i] -= 32;
	/*char *p = s;
	while(*p){
		if(*p >= 'a' && *p <= 'z') *p -= 32;
		p++;
	}*/ 
	return s;
}
//21. �Ƚ������ַ���s1��s2�Ĵ�С�����������ַ����е�һ����ͬ�ַ���ASCII��Ĳ�����ַ�����ͬ������0���磺"abcd"��"dddd"�Ľ��Ϊ-3��  int stringcmp(char *s1, char *s2);  
int stringcmp(const char *s1, const char *s2){
	for(;*s1 && *s2; s1++, s2++){
		if(*s1-*s2 != 0) return *s1-*s2;
	}
	if(*s1==0 || *s2==0) return *s1-*s2;
	return 0;
}
//22. ���ַ���s�д�pos��ʼ������Ϊlen���Ӵ���  char *substr(char *s, char *subs, int pos, int len);
char *substr(const char *s, char *subs, int pos, int len){
	int i=0;
	for(i=0; s[i+pos]!=0 && i<len; i++){
		subs[i] = s[i+pos];
	}
	subs[i] = 0;
	return subs;
}
//23. ���ַ���s�е�һ�γ����ַ�c��λ�ã���������ڷ���-1��   int charAt(char *s, char c);
//int find_first_of(char *s, char c)
int charAt(const char *s, char c){
	int pos = -1, i;
	for(i=0; s[i]!=0; i++)
		if(s[i] == c){
			pos = i; break;
		}
	return pos;
}
//24. ���ַ���s�е�һ�γ����ַ���ss��λ�ã� ��������ڷ���-1��   int strAt(char *s, char *ss);
//�˴�ʹ�ü�ƥ���㷨������Ȥ��ͬѧ�����KMP�㷨 
int strAt(char *s, char *ss){
	int i = 0, pos = -1, lens=length(s), lenss = length(ss);
	while(i+lenss < lens){
		if(s[i] == ss[0]){
			int j;
			for(j=1; s[i+j] == ss[j]; j++);
			if(j==lenss){
			pos = i; break;
			}
		}
		i++;
	}
	return pos;
}


//25. ���ַ���s��Ԫ����ĸ(�����ִ�Сд)�ĸ����� int vowels(char *s);
int vowels(char *s){
	int count = 0, i;
	for(i=0; s[i]!=0; i++)
		switch(s[i]){
			case 'a':
			case 'A':
			case 'e':
			case 'E':
			case 'i':
			case 'I':
			case 'o':
			case 'O':
			case 'u':
			case 'U': count++; break;
		}
	return count;
}



//26. ���ַ���s�г����ַ�c�ĸ�����  int chars(char *s, char c);
int chars(const char *s, char c){
	int count = 0, i;
	for(i=0; s[i]!=0; i++)
		if(s[i] == c){
			count++;
		}
	return count;
}
//27. ��һ���ַ����а��������������������������ĸ����� ��"123ab324xy3cumtb24xyz 17a"�а���5���������ֱ�Ϊ123, 324, 3, 24, 17��       int integers(char *s, int nums[]);
int integers(const char *s, int nums[]){
	int total=0, i=0, j;
	while(s[i]!=0){
		if(isNumberChar(s[i])){
			for(j=i+1; s[j]!=0 && isNumberChar(s[j]); j++);
			char t[20];
			substr(s, t, i, j-i); //���Ӵ� ��22. 
			nums[total] = str2Int(t); // ��2. 
			i = j+1;
			total++;
			continue;
		}
		i++;
	}
	return total;
}
//27. ��һ���ַ����а��������������������������ĸ����� ��"123ab324xy3cumtb24xyz 17a"�а���5���������ֱ�Ϊ123, 324, 3, 24, 17��
int int_numbers(int nums[], const char* s){
	int i=0, total = 0, isNum = 0, value = 0, j;
	char c;
	while(c=*(s+i)){
		if(!isNumberChar(c)) {
			isNum = 0;
		}
		else if(isNum == 0){ //���������ַ����һ������ 
				isNum = 1; 
				value = c - '0';
				j = i+1; 
				while(*(s+j) && isNumberChar(*(s+j))){
					value = value*10 + *(s+j) - '0';
					j++;
				} 
				nums[total] = value;
				total++;
				i = j-1;
		}
		i++;
	}
	return total;
}
//28. ��һ���ַ�c���뵽�ַ���sָ����λ���ϡ� char *insertchar(char *s, char c, int pos);
char *insertchar(char *s, char c, int pos){
	int i, len = length(s);
	for(i=len; i>pos; i--) s[i] = s[i-1];
	s[pos] = c;
	s[len+1]=0; 
	return s;
} 
//29. ��һ���ַ���s2���뵽�ַ���s1ָ����λ���ϡ� char *insertstr(char *s1, char *s2, int pos);
char *insertstr(char *s1, char *s2, int pos){
	int i, len1 = length(s1), len2 = length(s2);
	for(i=len1; i>=pos; i--) s1[i+len2] = s1[i];
	for(i=0; i<len2; i++)s1[pos+i]=s2[i];
	s1[len1+len2+1]=0;
	return s1;
}
//31. ��һ���ַ���s��ָ����λ��pos�ָ��������ַ���s1��s2��  void split(char *s, char *s1, char *s2, int pos);
void split(const char *s, char *s1, char *s2, int pos){
	int i;
	for(i=0; i<pos; i++){
		s1[i] = s[i];
	}
	s1[i]=0;
	for(i=pos; s[i]!=0; i++){
		s2[i-pos] = s[i];
	}
	s2[i-pos]=0;
}
//32. ��һ���ַ���s�а������ٸ����ʣ��Կո�ָ��������ж��������"I  Love  C  Language"������4�����ʡ� int words(char *s);
int words(char *s){
	int count=0, word=0, i;
	while(s[i]!=0){
		if(s[i] == ' ') word=0;
		else if(word == 0){
			word = 1; count++;
		}
		i++;
	}
	return count;
}
//33. ��һ���ַ���s�е������ַ�old�滻Ϊ��һ���ַ�new��  char *replace(char *s, char old, char new);
char *replace(char *s, char old, char new)
{
	char *p = s;
	while(*p){
		if(*p == old) *p = new;
		p++;
	}
	return s;
}
//34. ���ֲ��ң���һ������Ϊn����������p�У�����Ԫ��x�����������ڵ�λ�ã������Ԫ�ز����ڣ�����-1��
int binary_search(int *p, int n, int x){
	int low=0, high=n-1;
	while(low <= high){
		int mid = (low+high)/2;
		if(p[mid] == x) return mid;
		if(p[mid] > x) high = mid-1;
		else low = mid+1;
	}
	return -1;
}

//35. ��һ������Ϊn������p�У�����Ԫ��x��һ�γ��ֵ�λ�ã������Ԫ�ز����ڣ�����-1��
int findx(int *p, int n, int x){
	int i, pos = -1;
	for(i=0; i<n; i++){
		if(*(p+i) == x){
			pos = i; break;
		}
	}
	return pos;
}
//36. ���ַ���s�е�һ�γ���Ԫ����ĸ��λ�ã������ִ�Сд������������ڷ���-1��
int isVowel(char c){ //�ж��ַ��Ƿ�Ϊԭ����ĸ 
	int flag = 0;
	switch(c){
		case 'a':
		case 'A':
		case 'e':
		case 'E':
		case 'i':
		case 'I':
		case 'o':
		case 'O':
		case 'u':
		case 'U': flag = 1; break;
	}
	return flag;
}
int find_first_vowel(const char *s){
	int i, pos=-1;
	for(i=0; *(s+i)!=0; i++){
		if(isVowel(*(s+i))) {
			pos = i; break;
		}
	}
	return pos;
}
//37. ���ַ���s�г����ַ�c�Ĵ�����
//ͬ26.
//38. ��һ������Ϊn����������p�в���Ԫ��x��ʹ�ø�������Ȼ����
void insert(int *p, int n, int x){
	int i;
	for(i=n-1; i>=0 && *(p+i) > x; i--){
		*(p+i+1) = *(p+i);
	}
	*(p+i+1) = x; 
} 
//39. ���ַ���s��ָ��λ���ϲ�����һ���ַ����� 
//ͬ29. 
//40 ����n���ַ����У��Ƿ�����ַ���s�������ڷ��ص�һ�γ��ֵ�λ�ã����򷵻�-1. 
//�����ڷ���1�������ڷ���0���Լ��޸ļ��� 
int findstring(char str[][20], int n, const char* s)
{
	int i, pos = -1;
	for(i=0; i<n; i++){
		if(stringcmp(str[i], s) == 0){
			pos = i; break;
		}
	}
	return pos;
}
//41. ��ð�ݷ���һ����Ϊn����������p����
void bubble_sort(int *p, int n){
	int i, j;
	for(i=0; i<n-1; i++){
		for(j=0; j<n-1-i; j++){
			if(p[j] > p[j+1]){
				int t = p[j]; p[j] = p[j+1]; p[j+1] = t;
			}
		}
	}
} 
//42. ��ѡ�񷨶�һ����Ϊn����������p���� 
void selection_sort(int *p, int n){
	int i, j;
	for(i=0; i<n-1; i++){
		int k = i;
		for(j=i+1; j<n; j++){
			if(p[j] < p[k])k=j;
		}
		if(k!=i){
			int t=p[i]; p[i]=p[k]; p[k]=t;
		}
	}
}
//43. ʹ�ò������򷨶�һ����Ϊn����������a����
void insertion_sort(int *p, int n){
	int i, j;
	for(i=1; i<n; i++)
		insert(p, i, p[i]); //38. �����������в��� 
}
//44. �����ȷֱ�Ϊm��n��������������a��b���ϲ�����������c�У�ʹ��c��Ȼ���� 
void merge(int *dest, int *p, int m, int *q, int n){
	int i=0, j=0, k=0;
	while(i<m && j<n){
		if(p[i] < q[j]) dest[k++] = p[i++];
		else dest[k++] = q[j++];
	}
	if(i==m){
		while(j<n) dest[k++] = q[j++];
	}
	if(j == n){
		while(i<m) dest[k++] = p[i++];
	}
} 
//45 ��ð�ݷ���ѡ�񷨻�������򷨶�n���ַ������� 
void bubble_sort_strings(char s[][20], int n){
	int i, j;
	for(i=0; i<n; i++){
		for(j=0; j<n-1-i; j++){
			if(StrCmp(s[j], s[j+1])>0){
				char t[80];
				Copy(t, s[j]); 
				Copy(s[j], s[j+1]); 
				Copy(s[j+1], t);
			}
		}
	}
}
//46 ��ð�ݷ���ѡ�񷨻�������򷨶�n���ַ������� 
void selection_sort_strings(char s[][20], int n){
	int i, j;
	for(i=0; i<n-1; i++){
		int k=i; 
		for(j=i+1; j<n; j++){
			if(StrCmp(s[j], s[k])<0) k = j;
		} 
		if(k!=i){
			char t[80];
			Copy(t, s[i]); 
			Copy(s[i], s[k]); 
			Copy(s[k], t);
		}
	}
}
//47 ��ð�ݷ���ѡ�񷨻�������򷨶�n���ַ������� 
void insert_sort_string(char s[][20], int n, char *ss) {
	int i;
	for(i=n-1; i>=0 && StrCmp(s[i], ss)>0; i--){
		Copy(s[i+1], s[i]); 
	} ;
	Copy(s[i+1], ss); 
}
void insertion_sort_strings(char s[][20], int n){
	int i, j;
	for(i=1; i<n; i++)
		insert_sort_string(s, i, s[i]);
}
//48. ͳ��һ���ַ����г��ֲ�ͬ�ַ��ĸ��������ַ���"ababc3x"�к���5����ͬ�ַ���
int characters(const char *s){
	int i, k=0, total = 0, m = length(s);
	char ss[m]; //���ڴ洢s�����в�ͬ���ַ������m�� 
	for(i=0; i<m; i++){
		if(-1 == charAt(ss, s[i])) ss[k++] = s[i];
	}
	return k;
}
//49. дһ�������ж�һ������Ƿ�Ϊ����
int isLeapYear(int year){
	int flag = 0;
	if(year%4==0 && year%100!=0 || year%400==0)flag = 1;
	return flag;
} 
//50. ͳ���������֮������ĸ��� 
int totalLeapYears(int from, int end){
	int i, count=0;
	for(i=from; i<=end; i++)
		if(isLeapYear(i)) count++;
	return count;
}
//ģʽƥ�䣬BF�����㷨 
int bf(const char*s, const char* t){
	int i=0, j=0, k=0, tlen = length(t);
	for(k=0; s[k+tlen]!=0; k++){
		i=k;
		for(j=0;j<tlen; j++){
			if(s[i++] != t[j])break;
		}
		if(j == tlen) break;		
	}
	if(k+tlen <= length(s))
		return k;
	return -1;
}

//�ַ������� 
char* StrCat(char* s1, const char* s2){
	int i, j;
	for(i=0; *(s1+i) != 0; i++);
	for(j=0; *(s2+j)!=0; j++) *(s1+i++) = *(s2+j);
	*(s1+i) = 0;
	return s1;
} 

//�ַ����Ƚ� 
int StrCmp(const char* s1, const char* s2){
	int i;
	for(i=0; *(s1+i) == *(s2+i) && (*(s1+i) != 0 || *(s2+i) != 0);i++);
	return *(s1+i) - *(s2+i);
}
//�ַ������� 
char* Copy(char* s1, const char* s2){
	int i;
	for(i=0; *(s2+i)!=0; i++) *(s1+i) = *(s2+i);
	*(s1+i) = 0;
	return s1;
}
//ת��д 
char* StrUpr(char* s){
	int i;
	for(i=0; *(s+i); i++){
		if(*(s+i) >= 'a' && *(s+i) <= 'z') *(s+i) -= 32;
	}
	return s;
}
//תСд 
char* StrLwr(char *s){
	int i;
	for(i=0; *(s+i); i++){
		if(*(s+i) >= 'A' && *(s+i) <= 'Z') *(s+i) += 32;
	}
	return s;
}
//�����ַ��״γ��ֵ�λ�� 
int charAt2(const char* s, char c){
	int i, pos = -1;
	for(i=0; *(s+i); i++){
		if(*(s+i) == c) {pos = i;break;
		}
	}
	return pos;
}
//�ж��ַ��Ƿ�Ϊ�����ַ� 
int isNumberChar2(char c){
	if(c >= '0' && c <= '9') return 1;
	return 0;
}
//ͳ���ַ������������� 
int numbers2(int nums[], const char* s){
	int i=0, total = 0, isNum = 0, value = 0, j;
	char c;
	while(c=*(s+i)){
		if(!isNumberChar(c)) {
			isNum = 0;
		}
		else if(isNum == 0){
				isNum = 1; 
				value = c - '0';
				j = i+1; 
				while(*(s+j) && isNumberChar(*(s+j))){
					value = value*10 + *(s+j) - '0';
					j++;
				} 
				nums[total] = value;
				total++;
				i = j-1;
		}
		i++;
	}
	return total;
}

