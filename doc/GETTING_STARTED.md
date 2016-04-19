### Setup

To make sure we don't waste time at the Code Smash event just installing tools
on your laptop, we've prepared a Virtual Machine which will give you our
standard development setup.

1. **Install VirtualBox**

   You will need to download and install [VirtualBox][virtualbox-download]

2. **Start our virtual machine**

   This can be done within VirtualBox.

3. **Logging in**

   You can SSH into the virtual box. If you are on windows, we recommend installing [putty][putty-download]

   ```
      ssh vagrant@192.168.56.20
   ```

   The username and password for the virtual machine are both set to 'vagrant'.

   Once you have logged in, you will need to clone your GitHub repo, and CD into your repository like so

   ```shell
   git clone your_codesmash_repository_url
   cd your_codesmash_directory
   ```

   You are now ready to work! The [instructions below](#starting-the-app) give
   you the commands you need to run to start up Rails.

---

### <a name="running_rails"></a> Starting your Rails application

1. Install the "gems" (Ruby libraries):

   ```shell
   cd your_codesmash_directory
   bundle install
   ```

2. Prepare the database:

   ```shell
   rake db:setup
   ```

3. Start a Rails server:

   ```shell
   rake shopkeep:start
   ```

4. Visit `http://localhost:3000` in your browser - further useful details of the challenge should be displayed!

   __Note:__ We have configured the VirtualMachine to forward port 3000 on the host to the
   virtual machine, so the behaviour will be the same regardless of your setup.

5. To stop the server:

   ```shell
   rake shopkeep:stop
   ```

### Running the Tests

We have set the app up to use [RSpec][rspec], one of the most popular Ruby
testing frameworks. You can find the test files in `spec/` ("specifications"),
we will add more to get you started at the event. When the tests all pass,
you've passed!

1. Prepare the test database

   `rake db:test:prepare`

2. Run the specs

   `rspec`

You can read some best practice on writing specs at [Better Specs][betterspecs]

### Editing the files

#### Sharing

On a windows machine you will be able to access file sharing by visiting the following
server address within explorer

```
\\shopkeep-dev\vagrant
```

If you are on a Mac, you can enter the following path within `Finder` after running `cmd + k`

```
smb://shopkeep-dev
```

#### Vim

If you are a fan of Vim, you can also directly edit the application files with vim within your SSH
session.

[virtualbox-download]: https://www.virtualbox.org/wiki/Downloads
[putty-download]: https://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

[rspec]: http://rspec.info
[betterspecs]: http://betterspecs.org
