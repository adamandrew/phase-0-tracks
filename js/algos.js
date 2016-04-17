// function that takes an array of words and returns the longest words
// 	- loop through the array and check the lengths
// 		- keep track of the index and current longest length
// 		- if the length of a word is greater than the current longest length,
// 		keep its index in a variable
// 	- when loop is done, return the longest word using its index

function longest_word(array) {
	longest_index = 0;
	longest_length = 0;
	for (i = 0; i < array.length; i++) {
		if (array[i].length > longest_length) {
			longest_index = i;
			longest_length = array[i].length;
		}
	}
	return array[longest_index];
}

// fucntion that takes two objects and check if they share atleast one key-value pair
// 	- loop through all the keys of first object
//		- if there is identical pair, in other word, the values for a key in two object is the same,
// 		return true
// 	- if no identical pair, return false

function share_same_pair(object1, object2) {
	keys1 = Object.keys(object1)
	for (i = 0; i < keys1.length; i++) {
		if (object1[keys1[i]] == object2[keys1[i]]) {
			return true
		}
	}
	return false
}

// function that takes an integer and return an array of that length with random words of 1-10 letters
// 	- create an empty array
//  - loop integer times
// 		- create a word of random length from 1-10 letters
// 			- create empty string
// 			- loop random 1-10 times, each time add a random letter to the string
// 		- add the string to the array

function random_words(int) {
	words = []
	for (i = 1; i <= int; i++) {
		word = ""
		for (j = 1; j <= Math.floor((Math.random() * 10) + 1); j++) {
			word += String.fromCharCode(Math.floor((Math.random() * 26) + 97));
		}
		words.push(word);
	}
	return words;
}


// Driver codes
console.log(longest_word(["long phrase","longest phrase","longer phrase"]));
console.log(longest_word(["asdfa","safsafdsfdsfs","fsdeget"]));

obj1 = {name: "Steven", age: 54};
obj2 = {name: "Tamir", age: 54};
console.log(share_same_pair(obj1,obj2));
obj3 = {name: "Steven", age: 54};
obj4 = {name: "Tamir", age: 51};
console.log(share_same_pair(obj3,obj4));
obj5 = {name: "Steven", age: 54};
obj6 = {name: "Tamir", not_age: 54};
console.log(share_same_pair(obj5,obj6));

for (n = 0; n < 10; n++) {
	words = random_words(5);
	console.log(words);
	console.log(longest_word(words));
}