var colors = ["Red", "Purple", "Neon Green", "Black"];
var horses = ["Bullseye", "Shadowfax", "Shadowmere", "Ed"];
colors.push("Crimson");
horses.push("Zenyatta");

console.log(horses);
console.log(colors);

horseColors = new Object();
for (i = 0; i < horses.length; i++) {
	horseColors[horses[i]] = colors[i];
}


console.log(horseColors);

function Car(color, make, horsepower) {
	this.color = color;
	this.make = make;
	this.horsepower = horsepower;

	this.drive = function() { console.log("Vrooom!") };
}

var car = new Car("black", "Honda", 118);

car.drive();

for (anything in horseColors) {
	console.log(anything + horseColors[anything]);
}

var array = Object.keys(horseColors);
for (i = 0; i < array.length; i++) {
	console.log(array[i] + horseColors[array[i]])
}