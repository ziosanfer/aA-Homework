const fizzBuzz = function (array) {
    const divisibles = []
    for (let i = 0; i < array.length; i++) {
        const num = array[i]
        if (num % 3 === 0 && num % 5 != 0) {
            divisibles.push(num)
        } else if (num % 5 === 0 && num % 3 != 0) {
            divisibles.push(num)
        }
    }
    return divisibles
}


console.log(fizzBuzz([1,3,5,15,12,21,25,30]))