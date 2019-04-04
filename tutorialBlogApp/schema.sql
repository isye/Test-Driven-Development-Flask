CREATE DATABASE blog_tutorial;
DROP TABLE IF EXISTS public.tbl_author;
DROP TABLE IF EXISTS public.tbl_post;

CREATE TABLE public.tbl_author(
	id text NOT NULL,
	email text NOT NULL,
	password text NOT NULL,
	CONSTRAINT tbl_author_pk PRIMARY KEY (id)
);
CREATE TABLE public.tbl_post(
	id text NOT NULL,
	title text NOT NULL,
	content text NOT NULL,
	author_id text NOT NULL,
	created timestamp NOT NULL DEFAULT now(),
	CONSTRAINT tbl_post_pk PRIMARY KEY (id),
	CONSTRAINT tbl_post_fk FOREIGN KEY (author_id) REFERENCES 		public.tbl_author (id) MATCH FULL
);

insert into tbl_author("id", email, "password") values('3b2e7a90-2da7-4bad-a3de-d7df49697ff9', 'author1@test.com','pbkdf2:sha256:50000$KkpGxTYv$20fcd99a9b8abb3a1f0480026580c523b5845a56146f379e61ad1ec16d0d4ccc');
insert into tbl_post("id", title,sub_title,"content",author_id) VALUES ('d2bd9115-6484-4814-9c79-766960b27ba0', 'Deploy Flask App on Heroku',
'<span><ul><p><li>Prepare the Flask project</li>More information regarding Flask project can be found <a href="http://flask.pocoo.org/docs/1.0/quickstart/">here</a>.<br>Before it is deployed, make sure the project is running well in local machine.</p><p><li>Create file requirements.txt</li>This file contains all library that are needed for the project. Put inside project folder.</p><p><li>Create Procfile</li>Example Procfile content:<pre>web: gunicorn -b 0.0.0.0:$PORT your_app_package:app</pre></p><p><li>Create app in Heroku</li>For example, the name of the app is arieshanti-weblog<pre><code class="language-bash" data-lang="bash"><span class="gp">$ </span>heroku create -a arieshanti-weblog<br>Creating ⬢ arieshanti-weblog... done <br>https://arieshanti-weblog.herokuapp.com/ | https://git.heroku.com/arieshanti-weblog.git</code></pre></p><p><li>Deploy the project</li>Make sure current directory is in project directory<pre><code class="language-bash" data-lang="bash"><span class="gp">$ </span>git push heroku master</code></pre>When succeed, the app will be live in : https://[app-name].herokuapp.com<br>For example, https://arieshanti-weblog.herokuapp.com</p></ul></span>',
'3b2e7a90-2da7-4bad-a3de-d7df49697ff9');
insert into tbl_post("id", title,sub_title,"content",author_id) VALUES ('4fb2777f-ae0d-4107-b8c3-9b28b4e9aa1f', 'Deploy Vue.js App on Heroku', 'Steps to deploy Vue.js App on Heroku', '<span><p><li>Prepare the existing Vue.js application. I use Nuxt.js framework</li>More information regarding Nuxt.js framework can be read <a href="https://nuxtjs.org/guide/">here</a>.<br>When the application is running well (without error) in local machine, then it is ready to be deployed in Heroku</p><p><li>The next step is Create app in Heroku</li>For example, the name of the app is tutorial-blog<pre><code class="language-bash" data-lang="bash"><span class="gp">$ </span>heroku create -a tutorial-blog<br>Creating ⬢ tutorial-blog... done<br>https://tutorial-blog.herokuapp.com/ | https://git.heroku.com/tutorial-blog.git</code></pre></p><p><li>Deploy the project</li>Make sure current directory is in project directory<pre><code class="language-bash" data-lang="bash"><span class="gp">$ </span>git add .<br><span class="gp">$ </span>git commit -m "first commit"<br><span class="gp">$ </span>git push heroku master<br></code></pre>Wait until the deployment finished.</p><p><li>Setting the config var for the Heroku app</li><pre><code class="language-bash" data-lang="bash"><span class="gp">$ </span>heroku config:set NPM_CONFIG_PRODUCTION=false<br>$ heroku config:set HOST=0.0.0.0<br>$ heroku config:set NODE_ENV=production<br></code></pre></p></ul></span>', '3b2e7a90-2da7-4bad-a3de-d7df49697ff9');



