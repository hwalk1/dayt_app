# Dayt 🌏
Dayt is a travel planning app designed to make planning your next trip simple and easy while providing authentic experiences recommended by locals

To see it in action, it is currently live at: https://www.dayt.travel/

This Rails project was made during our time at the [Le Wagon](https://www.lewagon.com/) full-stack developer bootcamp in Melbourne

## How to run
Run the following commands in the downloaded directory to have it running on localhost:3000

Install dependencies with yarn and bundle:
```
bundle install
```
```
yarn install
```

To create the postgres database:
```
rails db:create
```
To migrate the database to the most up to date schema:
```
rails db:migrate
```
To seed the database with some users and dayts(experiences):
```
rails db:seed
```
A .env file will need to be created in the root directory with api keys to [cloudinary](https://cloudinary.com/) and [mapbox](https://www.mapbox.com/) with the following variable names:
```
CLOUDINARY_URL
MAPBOX_API_KEY
```
Setup should now be complete and can be hosted locally on localhost:3000 with the following command:
```
rails s
```
Happy Travelling! ✈️
## Creators
Made with ❤️ by [Lea](https://github.com/Lea-ah), [Michael](https://github.com/dcrv-exe), [Hayden](https://github.com/hwalk1) and [Aren](https://github.com/arenclissold)
