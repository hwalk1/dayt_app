<div id="top"></div>
<!--
***  Many thanks to Best-README-Template for this, check them out and star the project!
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
-->


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/hwalk1/dayt_app">
    <img src="app/assets/images/DAYT-thick.png" alt="Logo" width="300" height="100">
  </a>

<h3 align="center">Dayt 🌏</h3>

  <p align="center">
    Dayt is a travel planning app designed to make planning your next trip simple and easy while providing authentic experiences recommended by locals

To see it in action, it is currently live at: https://www.dayt.travel/

This Rails project was made during our time at the [Le Wagon](https://www.lewagon.com/) full-stack developer bootcamp in Melbourne

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
    <br />
    <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://dayt.travel">View Demo</a>
    ·
    <a href="https://github.com/hwalk1/dayt_app/issues">Report Bug</a>
    ·
    <a href="https://github.com/hwalk1/dayt_app/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<a href="https://github.com/hwalk1/dayt_app">
    <img src="app/assets/images/Dayt-Product-Page (1).png" alt="Logo" width="1000" height="600">
</a>


<p> When arriving to a new destination or city, instead of spending time reading guidebooks, paying for expensive tours, or going through blogs and ultimately waisting time visiting things that weren’t for you. 

Wouldn’t it be great to have access to local knowledge tailored specifically to you based on your interests, allowing you to quickly sort and create your perfect day. 

Dayt (D A Y T) gives users the ability to build their perfect day itinerary with locally generated recommendations, this social travel platform connects traveler's with access to knowledge that would take years to discover on their own.

Dayt, a mobile first web app shows you current user generated activities based on your location and interests for example museums, sunsets and live music. A stack of activity profiles are shown to you and the ability to swipe left or right can add them to your itinerary. In a matter of seconds and with all the information you need about the restaurant, cafe or landmark to truly travel like a local.

It will keep showing you activities until your time (1 hours, 3 hours, 1 day) is all filled up and gives you a view of your day, directions and transport options to your stops.
 
</p>

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [JavaScript](https://www.javascript.com/)
* [Bootstrap](https://getbootstrap.com)
* [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [SASS](https://sass-lang.com/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
### Installation

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

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Premium Portal
- [ ] User Profile
    - [ ] Create Dayts
    - [ ] Dashboard

See the [open issues](https://github.com/hwalk1/dayt_app/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Hayden Walker - haydenjwalker1@gmail.com

Project Link: [https://github.com/hwalk1/dayt_app](https://github.com/hwalk1/dayt_app)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Creators
Made with ❤️ by [Lea](https://github.com/Lea-ah), [Michael](https://github.com/dcrv-exe), [Hayden](https://github.com/hwalk1) and [Aren](https://github.com/arenclissold)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
