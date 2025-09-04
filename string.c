int main(){
  char x[4] = "efhg";  // The DWORD PTR [ebp-0x4], 0x67686665 + DWORD PTR [ebp-0x8], 0x00 
  push(x);             // push string in to the stack
  return 0;
}
