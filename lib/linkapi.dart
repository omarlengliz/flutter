class AppLink {
  static const server = "https://mobilenode-e3t8.onrender.com" ; 

  static const users="$server/api/users"  ;   


  static const signUp="$users/register" ; 
  static const login="$users/login" ; 
  static const sendVerificationCode="$users/send-verification-code" ; 
  static const verifCode="$users/verify-code" ; 

  static const genres="$server/api/genres" ;
  static const getGenres="$genres/getAll" ;


  static const books="$server/api/books" ;
  static const getBooks="$books/getAll" ;
  static const getBookById=books;
  

} 