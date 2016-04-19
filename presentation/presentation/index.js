// Import React
import React from "react";

// Import Spectacle Core tags
import {
  Appear,
  BlockQuote,
  Cite,
  CodePane,
  Deck,
  Fill,
  Heading,
  Image,
  Layout,
  Link,
  ListItem,
  List,
  Quote,
  Slide,
  Spectacle,
  Text
} from "spectacle";

// Import image preloader util
import preloader from "spectacle/lib/utils/preloader";

// Import theme
import createTheme from "spectacle/lib/themes/default";

// Require CSS
require("normalize.css");
require("spectacle/lib/themes/default/index.css");
require("./index.css")

const images = {
  logo: require("../assets/logo.svg"),
  rails: require("../assets/rails.png"),
  ruby: require("../assets/ruby.png"),
  rspec: require("../assets/rspec.png"),
  bindingPry: require('../assets/binding-pry.png'),
  statusEndpoint: require("../assets/status-endpoint.png"),
  firstBackground: require('../assets/first-background.png'),
  testOutput: require('../assets/test-output.png')
};

preloader(images);

const theme = createTheme({
  slideBackground: "white",
  primary: '#1B2735',
  secondary: '#1B2735',
  primaryHeadingColor: "#1B2735",
  primaryTextColor: "#525E71"
});

export default class Presentation extends React.Component {
  render() {
    return (
      <div>
        <div className='footer'>
          <img src={images.logo} className='shopkeep-logo'/>
        </div>
        <Spectacle theme={theme}>
          <Deck transition={["zoom", "slide"]} transitionDuration={500}>
            <Slide transition={["slide"]} bgImage={images.firstBackground.replace("/", "")}>
              <Image src={images.logo} className='shopkeep-logo'/>

              <Heading size={2} caps textColor="white" className="important-heading">
                Code Smash
              </Heading>
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={2} textColor="primaryHeadingColor">
                The Problem
              </Heading>

              <Text textColor="primaryTextColor">Write a <Link href='http://www.json.org/'>JSON</Link> webservice that...</Text>

              <List textColor="primaryTextColor">
                <ListItem>Saves Sales Information</ListItem>
                <ListItem>Reads Sales Information</ListItem>
                <ListItem>Provides Reporting</ListItem>
              </List>
            </Slide>
            <Slide transition={["slide"]} bgColor="slideBackground" >
              <Heading size={2} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Technology Stack
              </Heading>

              <Layout>
                <Fill>
                  <div className='technology-stack'>
                    <Image src={images.ruby.replace('/', '')} width="100px" />
                  </div>
                  <Heading size={6} textColor="primaryTextColor" textFont="primary">
                    Ruby
                  </Heading>
                </Fill>
                <Fill>
                  <div className='technology-stack'>
                    <Image src={images.rails.replace('/', '')} width="100px" />
                  </div>
                  <Heading size={6} textColor='primaryTextColor'>
                    Ruby on Rails
                  </Heading>
                </Fill>
                <Fill>
                  <div className='technology-stack'>
                    <Image src={images.rspec.replace('/', '')} width="100px" />
                  </div>
                  <Heading size={6} textColor='primaryTextColor'>
                    RSpec
                  </Heading>
                </Fill>
              </Layout>
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground" >
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Example
              </Heading>
              <Text color='primaryTextColor'>Status Endpoint</Text>
            </Slide> 

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Text color='primaryHeadingColor'>app/controllers/status_controller.rb</Text>
              <CodePane
                lang="ruby"
                source={require("raw!../../app/controllers/status_controller.rb")}
                margin="20px auto"
              />
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={5} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Running the server
              </Heading>    
              <CodePane
                lang="shell"
                source={'rake shopkeep:start'}
                margin="20px auto"
              />
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={5} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Visiting the URL
              </Heading>        

              <Image src={images.statusEndpoint.replace('/', '')}/>
              <Appear><Text>Convention: '/status' will call the StatusController</Text></Appear>
            </Slide>


            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                RSpec
              </Heading>
              
              <Image src={images.rspec.replace('/', '')} width="100px" />

              <Text>Our Test tool of choice</Text>
            </Slide>          

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Example
              </Heading>
              
              <CodePane
                lang="ruby"
                source={require("raw!../assets/rspec-example.rb")}
                margin="20px auto"
              />
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Status Endpoint Tests
              </Heading>
              
              <CodePane
                lang="ruby"
                source={require("raw!../../spec/requests/api/000_status_spec.rb")}
                margin="20px auto"
              />
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary" margin={50}>
                Running Tests
              </Heading>
              
              <Image src={images.testOutput.replace('/', '')}/>

              <CodePane
                lang="shell"
                source={'rspec ./spec/requests/api/000_status_spec.rb'}
                margin="20px auto"
              />
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary" caps fit>
                Getting Started
              </Heading>
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <List>
                <ListItem>Download the Virtual Machine</ListItem>
                <ListItem>Fork and clone the Github Repo</ListItem>
                <ListItem>Run the rspec tests</ListItem>
                <ListItem>Make <u>all</u> tests green, win the prizes!</ListItem>
                <Appear><ListItem>More Details found within GETTING_STARTED.md</ListItem></Appear>
              </List>
            </Slide>

            <Slide transition={["slide"]} bgColor="slideBackground">
              <Heading size={4} textColor="primaryHeadingColor" textFont="primary">
                One more thing...
              </Heading>

              <Image src={images.bindingPry.replace('/', '')} />
            </Slide>

            <Slide transition={["slide"]} bgImage={images.firstBackground.replace("/", "")}>
              <Image src={images.logo} className='shopkeep-logo'/>

              <Heading size={2} caps textColor="white" className="important-heading">
                Good Luck!
              </Heading>
            </Slide>
          </Deck>
        </Spectacle>
      </div>
    );
  }
}
