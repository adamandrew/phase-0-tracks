// A reverse function which reverse a string
// 	- make an empty string
// 	- count the length of the string
//  - run the loop from the length of string down to 1
// 		- by running loop from the length to 1, store the characters into the empty string
//		from last character to the first character.
// 	- return the new string

function reverse(string) {
	new_string = "";
	for (var i = string.length - 1; i >= 0; i--) {
		new_string = new_string + string.charAt(i)
	};
	return new_string;
}

var reverse_hello = reverse("hello");
console.log(reverse_hello);
console.log(2 == 2);