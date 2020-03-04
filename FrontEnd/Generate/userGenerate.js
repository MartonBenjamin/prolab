const faker = require('faker');

generateUser = () => {
    return{
        user:faker.name.firstName(),
        password:faker.internet.password(),
        email: faker.internet.email(),
        first_name:faker.name.firstName(),
        last_name:faker.name.lastName(),
        created_at:faker.date.recent().toISOString()
    }
};

var Users = [];
const User_Count=100;
for (i= 0; i<User_Count; i++){
    Users[i] = generateUser();
    Users[i]['id']=i;
}
console.log(Users)


