--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO d54idb2u789rq;

--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.article_categories (
    id bigint NOT NULL,
    article_id bigint,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.article_categories OWNER TO d54idb2u789rq;

--
-- Name: article_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: d54idb2u789rq
--

CREATE SEQUENCE public.article_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_categories_id_seq OWNER TO d54idb2u789rq;

--
-- Name: article_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: d54idb2u789rq
--

ALTER SEQUENCE public.article_categories_id_seq OWNED BY public.article_categories.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    image_url character varying,
    title character varying,
    article_body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    time_to_read character varying,
    slug character varying,
    number_of_reads integer DEFAULT 0,
    user_id bigint
);


ALTER TABLE public.articles OWNER TO d54idb2u789rq;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: d54idb2u789rq
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO d54idb2u789rq;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: d54idb2u789rq
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO d54idb2u789rq;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: d54idb2u789rq
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO d54idb2u789rq;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: d54idb2u789rq
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.followers (
    id bigint NOT NULL,
    follower_id integer,
    followed_id integer
);


ALTER TABLE public.followers OWNER TO d54idb2u789rq;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: d54idb2u789rq
--

CREATE SEQUENCE public.followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followers_id_seq OWNER TO d54idb2u789rq;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: d54idb2u789rq
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    user_id bigint,
    article_id bigint
);


ALTER TABLE public.likes OWNER TO d54idb2u789rq;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: d54idb2u789rq
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO d54idb2u789rq;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: d54idb2u789rq
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO d54idb2u789rq;

--
-- Name: users; Type: TABLE; Schema: public; Owner: d54idb2u789rq
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    bio text,
    image_url character varying,
    is_admin boolean DEFAULT false,
    full_name character varying
);


ALTER TABLE public.users OWNER TO d54idb2u789rq;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: d54idb2u789rq
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO d54idb2u789rq;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: d54idb2u789rq
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: article_categories id; Type: DEFAULT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.article_categories ALTER COLUMN id SET DEFAULT nextval('public.article_categories_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-05-07 16:09:53.944251	2019-05-07 16:09:53.944251
\.


--
-- Data for Name: article_categories; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.article_categories (id, article_id, category_id, created_at, updated_at) FROM stdin;
1	5	1	2019-05-27 13:20:38.681429	2019-05-27 13:20:38.681429
6	9	4	2019-05-28 01:48:15.721917	2019-05-28 01:48:15.721917
7	6	7	2019-05-28 02:33:58.54224	2019-05-28 02:33:58.54224
8	1	13	2019-05-28 02:39:18.86531	2019-05-28 02:39:18.86531
9	2	14	2019-05-28 02:43:26.991381	2019-05-28 02:43:26.991381
10	7	2	2019-05-28 02:48:18.026161	2019-05-28 02:48:18.026161
11	7	7	2019-05-28 02:48:18.030563	2019-05-28 02:48:18.030563
12	4	15	2019-05-28 02:49:54.362888	2019-05-28 02:49:54.362888
13	3	2	2019-05-28 02:50:15.348396	2019-05-28 02:50:15.348396
14	3	7	2019-05-28 02:50:15.350314	2019-05-28 02:50:15.350314
15	10	13	2019-06-17 22:14:27.517457	2019-06-17 22:14:27.517457
16	10	15	2019-06-17 22:14:27.523347	2019-06-17 22:14:27.523347
19	15	2	2019-06-23 02:43:15.461959	2019-06-23 02:43:15.461959
20	15	7	2019-06-23 02:43:15.465835	2019-06-23 02:43:15.465835
21	16	13	2019-06-23 02:54:11.722107	2019-06-23 02:54:11.722107
22	17	5	2019-06-23 03:06:21.817127	2019-06-23 03:06:21.817127
23	18	7	2019-06-23 03:38:12.065942	2019-06-23 03:38:12.065942
24	19	2	2019-06-27 06:35:29.302373	2019-06-27 06:35:29.302373
25	19	7	2019-06-27 06:35:29.306219	2019-06-27 06:35:29.306219
26	20	1	2019-06-27 06:58:20.604648	2019-06-27 06:58:20.604648
27	42	10	2019-07-21 04:35:28.813308	2019-07-21 04:35:28.813308
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.articles (id, image_url, title, article_body, created_at, updated_at, time_to_read, slug, number_of_reads, user_id) FROM stdin;
4	mh-muscular-man-working-out-in-gym-strong-male-torso-royalty-free-image-924491214-1557166711.jpg	Tips For Growing Muscles	<p>Why do you work out?</p><p>Are you trying to get stronger?&nbsp;<a href="https://www.menshealth.com/fitness/a19534319/5-fast-rules-bigger-leaner-stronger/" target="_blank" style="color: rgb(0, 0, 0);">We can help with that</a>. Are you in it for the less tangible health benefits, like&nbsp;<a href="https://www.menshealth.com/fitness/a19517546/lifting-weights-helps-you-live-longer/" target="_blank" style="color: rgb(0, 0, 0);">stronger bones and an increased lifespan</a>? Maybe you just want to a new hobby, since everyone seems like they're spending more time and attention focused on exercise and showing their #gainz on social media.</p><p>For some guys, the answer to the exercise question will always be that they're looking to put on muscle. Whether you have a very specific goal, like getting into figure contests and bodybuilding, or you just want to fill out a t-shirt, you have to start somewhere, even if you've always struggled to add and keep weight onto a skinny frame in the past.</p><p>But forget about your alleged high-revving metabolism, says Doug Kalman, PhD, R.D., co-founder of the International Society of Sports Nutrition (ISSN). “Most lean men who can’t gain muscle weight are simply eating and exercising the wrong way,” he says.</p><p>Here’s your fix: Follow these 10 principles to pack on as much as a pound of muscle each week, especially if you're just starting to train in the weight room.</p><h3>The 10 Principles to Pack On Muscle</h3><p class="ql-align-center"><img src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/man-sitting-on-weight-bench-lifting-dumb-bells-royalty-free-image-1134418332-1557166788.jpg?crop=1xw:1xh;center,top&amp;resize=480:*" alt="Man sitting on weight bench lifting dumb bells"></p><p class="ql-align-center">RIMAGINE GROUP LIMITEDGETTY IMAGES</p><p class="ql-align-center">ADVERTISEMENT - CONTINUE READING BELOW</p><p class="ql-align-center"><br></p><p><br></p><h4>1. Maximize Muscle Building</h4><p>The more protein your body stores—in a process called protein synthesis—the larger your muscles grow. But your body is constantly draining its protein reserves for other uses—making hormones, for instance.</p><p>The result is less protein available for muscle building. To counteract that, you need to “build and store new proteins faster than your body breaks down old proteins,” says Michael Houston, Ph.D., a professor of nutrition at Virginia Tech University.</p><h4>2. Eat Meat</h4><p>Shoot for about 1 gram of protein per pound of body weight, which is roughly the maximum amount your body can use in a day, according to a landmark study in the&nbsp;<em>Journal of Applied Physiology</em>.</p><p>For example, a 160-pound man should consume 160 grams of protein a day—the amount he’d get from an 8-ounce chicken breast, 1 cup of cottage cheese, a roast-beef sandwich, two&nbsp;<a href="https://www.menshealth.com/nutrition/a19545596/cook-with-protein-powder/" target="_blank" style="color: rgb(0, 0, 0);">eggs</a>, a glass of milk, and 2 ounces of peanuts.</p><p>Split the rest of your daily calories equally between carbohydrates and fats.</p><h4>3. Eat More</h4><p class="ql-align-center"><img src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/grilled-chicken-and-rice-salad-bowl-royalty-free-image-1043282118-1557166966.jpg?crop=1xw:1xh;center,top&amp;resize=480:*" alt="Grilled chicken and rice salad bowl"></p><p class="ql-align-center">OATMEALSTORIESGETTY IMAGES</p><p><br></p><p>In addition to adequate protein, you need more calories. Use the following formula to calculate the number you need to take in daily to gain 1 pound a week. (Give yourself 2 weeks for results to show up on the bathroom scale. If you haven’t gained by then, increase your calories by 500 a day.)</p><ul><li>A. Your weight in pounds: _____</li><li>B. Multiply A by 12 to get your basic calorie needs: _____</li><li>C. Multiply B by 1.6 to estimate your resting metabolic rate (calorie burn without factoring in exercise): _____</li><li>D. Strength training: Multiply the number of minutes you lift weights per week by 5: _____</li><li>E. Aerobic training: Multiply the number of minutes per week that you run, cycle, and play sports by 8: _____</li><li>F. Add D and E, and divide by 7: _____</li><li>G. Add C and F to get your daily calorie needs: _____</li><li>H. Add 500 to G: _____. This is your estimated daily calorie needs to gain 1 pound a week.</li></ul><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://riddler.hearstgames.com/dist/polls.iframe.html?id=3c72065f-3982-4a75-b53d-e0a68578b627_e4d18c1c37fd7&amp;type=text&amp;question=What%20do%20you%20think%20has%20prevented%20you%20from%20gaining%20mass%20and%20muscle%20before%3F&amp;answer1=I%20haven%27t%20been%20able%20to%20consume%20enough%20protein%2C%20so%20I%27m%20lacking%20there.&amp;answer2=I%20haven%27t%20done%20enough%20work%20in%20the%20weight%20room.%20I%20need%20to%20work%20out%20more.&amp;brand=Men%27s%20Health&amp;siteId=c7b9f75a-2f85-4251-a92e-dbc6c7213473&amp;adCategory=health-fitness&amp;section=Fitness&amp;subSection=&amp;editor=Adam%20Campbell&amp;authors=Adam%20Campbell&amp;site=Men%27s%20Health&amp;stylesheet=https%3A%2F%2Fassets.hearstapps.com%2Fsites%2Fmenshealth%2Fassets%2Fcss%2Fpolls.4a97a46.css&amp;marketingpolls=true"></iframe><p><br></p><h4>4. Work Your Biggest Muscles</h4><p>If you’re a beginner, just about any workout will be intense enough to increase protein synthesis. But if you’ve been lifting for a while, you’ll build the most muscle quickest if you focus on the large muscle groups, like the chest, back, and legs.</p><p>Add squats, deadlifts, pullups, bent-over rows, bench presses, dips, and military presses to your workout. Do two or three sets of eight to 12 repetitions, with about 60 seconds’ rest between sets. That rep range will put your muscle cells on the fast track to hypertrophy, the process they use to grow.</p><h4>5. Have a Drink First</h4><p>A 2001 study at the University of Texas found that lifters who drank a shake containing amino acids and carbohydrates before working out increased their protein synthesis more than lifters who drank the same shake after exercising.</p><p>The shake contained 6 grams of essential amino acids—the muscle-building blocks of protein—and 35 grams of carbohydrates.</p><p>“Since exercise increases bloodflow to your working tissues, drinking a carbohydrate-protein mixture before your workout may lead to greater uptake of the amino acids in your muscles,” says Kevin Tipton, Ph.D., an exercise and nutrition researcher at the University of Texas in Galveston.</p><p>For your shake, you’ll need about 10 to 20 grams of protein—usually about one scoop of a whey-protein powder. Can’t stomach protein drinks? You can get the same nutrients from a sandwich made with 4 ounces of deli turkey and a slice of American cheese on whole wheat bread. But a drink is better.</p><p>“Liquid meals are absorbed faster,” says Kalman. So tough it out. Drink one 30 to 60 minutes before your workout.</p><h4>6. Lift Every Other Day</h4><p class="ql-align-center"><img src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/man-lifting-barbell-in-gymnasium-royalty-free-image-147205543-1557167218.jpg?crop=1xw:1xh;center,top&amp;resize=480:*" alt="Man lifting barbell in gymnasium"></p><p class="ql-align-center">ROBERT DALYGETTY IMAGES</p><p>Do a full-body workout followed by a day of rest. Studies show that a challenging weight workout increases protein synthesis for up to 48 hours immediately after your exercise session.</p><p class="ql-align-center">ADVERTISEMENT - CONTINUE READING BELOW</p><p class="ql-align-center"><br></p><p><br></p><p>“Your muscles grow when you’re resting, not when you're working out,” says Michael Mejia, C.S.C.S.,&nbsp;<em>Men’s Health</em>&nbsp;exercise advisor and a former skinny guy who packed on 40 pounds of muscle using this very program.</p><h4>7. Down the Carbs After Your Workout</h4><p>Research shows that you'll rebuild muscle faster on your rest days if you feed your body carbohydrates.</p><p>“Post-workout meals with carbs increase your insulin levels,” which, in turn, slows the rate of protein breakdown, says Kalman. Have a banana, a sports drink, a peanut-butter sandwich.</p><h4>8. Eat Something Every 3 Hours</h4><p>“If you don’t eat often enough, you can limit the rate at which your body builds new proteins,” says Houston.</p><p>Take the number of calories you need in a day and divide by six. That’s roughly the number you should eat at each meal. Make sure you consume some protein—around 20 grams—every 3 hours.</p><h4>9. Make One Snack Ice Cream</h4><p class="ql-align-center"><img src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/directly-above-shot-of-mint-ice-cream-in-bowl-on-royalty-free-image-638712349-1557166263.jpg?crop=1xw:1xh;center,top&amp;resize=480:*" alt="Directly Above Shot Of Mint Ice Cream In Bowl On Table"></p><p class="ql-align-center">MUHAMMAD WAHIZUL HASWAN ABDUL AZIZ / EYEEMGETTY IMAGES</p><p>This tip will be the easiest to follow by far: Have a bowl of ice cream (any kind) 2 hours after your workout.</p><p>According to a study in the&nbsp;<em>American Journal of Clinical Nutrition</em>, this snack triggers a surge of insulin better than most foods do. And that’ll put a damper on post-workout protein breakdown.</p><h4>10. Have Milk Before Bed</h4><p>Eat a combination of carbohydrates and protein 30 minutes before you go to bed. The calories are more likely to stick with you during sleep and reduce protein breakdown in your muscles, says Kalman.</p><p>Try a cup of raisin bran with a cup of skim milk or a cup of cottage cheese and a small bowl of fruit. Eat again as soon as you wake up.</p><p>“The more diligent you are, the better results you’ll get,” says Kalman.</p><h3>The Whey To Go for Muscle Growth</h3><p class="ql-align-center"><img src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/young-man-making-protein-shake-before-training-royalty-free-image-1094095844-1557159032.jpg?crop=1xw:1xh;center,top&amp;resize=480:*" alt="Young man making protein shake before training"></p><p class="ql-align-center">ALEKSANDARNAKICGETTY IMAGES</p><p class="ql-align-center">ADVERTISEMENT - CONTINUE READING BELOW</p><p class="ql-align-center"><br></p><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://tpc.googlesyndication.com/safeframe/1-0-33/html/container.html" height="250" width="300"></iframe><p><br></p><p>Drink this protein power shake before every workout.</p><p>Weight-gain powders seem like an easy solution to a skinny guy’s problems. After all, they pack as many as 2,200 calories into one serving. But you’re not getting what you pay for.</p><p>“High-calorie weight-gain drinks usually get more than 80 percent of their calories from sugar,” says Doug Kalman, R.D. And downing that much sugar can give you an upset stomach and diarrhea.</p><p>So, in a sense, you’re flushing good money down the toilet. “You’ll get much better results by spreading your calories throughout the day,” says Kalman.</p><p>And by using protein shakes. Look for&nbsp;<a href="https://www.menshealth.com/nutrition/g19547347/best-whey-powder-review/" target="_blank" style="color: rgb(0, 0, 0);">whey protein powders</a>&nbsp;at nutrition stores. Combine one scoop of the powder with the following ingredients and blend for a homemade muscle-building pre-workout shake:</p><ul><li>1 tsp olive or flaxseed oil</li><li>1/2 c fat-free yogurt</li><li>1 c grape or apple juice</li></ul><p>Stats per shake:&nbsp;335 calories, 27 gram protein, 45 grams carbohydrates, 6 grams fat</p><p>Want more protein-packed muscle-building goodness? Check out&nbsp;<a href="https://www.menshealth.com/nutrition/a19545933/healthy-protein-smoothie-recipes/" target="_blank" style="color: rgb(0, 0, 0);">these healthy shake recipes</a>.</p><p><br></p>	2019-05-08 12:28:55.908826	2019-05-30 03:33:05.695367	7 min	tips-for-growing-muscles-4	17	4
3	Screen_Shot_2019-02-17_at_6.32.36_PM.png	How to exit vim in 5 simple steps.	<p><em>*This post is the first in my ‘Pre-Job Series’ — for more info,&nbsp;</em><a href="https://medium.com/@elizabethvenner/the-pre-job-series-makers-academy-and-before-ec5f3d785065" target="_blank" style="color: inherit;"><em>check it out here</em></a><em>*</em></p><p>Sound familiar? For those of you, going ‘Huh?’, imagine the situation. You have written some code, diligently ran&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">git status</code>&nbsp;to check which files have changed, added the files and even ran&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">git status</code>&nbsp;again just to check everything has been staged properly like so:</p><p><img src="https://cdn-images-1.medium.com/max/1600/1*yxVpk_tpJ55FoeCAoau5fQ.png"></p><p>So far so good. But then type<code style="background-color: rgba(0, 0, 0, 0.05);">git commit</code>&nbsp;and this happens:</p><p><img src="https://cdn-images-1.medium.com/max/1600/1*p-tiZIHNuZYJbxMlkis-Dw.png"></p><p>Gaaah?!?!@&gt;&lt;?!</p><p>The astute amongst you will have noticed that instead of writing&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">git commit -m 'my commit message'</code>, I just wrote&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">git commit</code>.</p><p>Because you can’t make a commit on git without a message, what has happened is that git has opened an editor called vim in order to force you to do so. Now the problem here is that many folk, especially newbies just starting out¹ sometimes get a bit over-excited with their commits and forget to add a flag and their message. And then when this screen happens, it’s nothing they’ve ever seen before and they don’t even know how to google it because they don’t know what it is. And worse still, they can’t get out of it without simply shutting down the terminal window, which I think we all agree is a pain.²</p><p>Git also opens vim during merges and I’m pretty sure vim also seemingly randomly opens in other circumstances that I can’t bring to mind at this precise moment.</p><p>The effect that this has is more or less like wandering through a city you know well, opening a door and finding yourself in Narnia, complete with talking animals and scary witch. Oh, and the door you entered through has somehow disappeared.</p><p>But exiting the vim screen of what the effing crap is actually very simple. Once you know that what has essentially happened is that a vim editor has opened in your terminal window, you can just google from there. In fact, over one million developers have done just that! It is in fact the top searched question on Stack Overflow:</p><p><a href="https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/" target="_blank" style="background-color: rgba(255, 255, 255, 0); color: inherit;">Stack Overflow: Helping One Million Developers Exit Vim - Stack Overflow Blog</a></p><p><br></p><p><a href="https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/" target="_blank" style="background-color: rgba(255, 255, 255, 0); color: inherit;">This morning, a popular Stack Overflow question hit a major milestone: You're not alone, jclancy. In the five years…</a></p><p><a href="https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/" target="_blank" style="background-color: rgba(255, 255, 255, 0); color: inherit;">stackoverflow.blog</a>But to save you the hassle, here’s what you do:</p><ol><li>Type&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">i</code>. The editor opens in ‘normal’ mode, where everything you type is interpreted as a command and where you can do stuff like saving the file and exiting. Typing&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">i</code>&nbsp;means that you switch to ‘insert’ mode which allows you to edit the actual file you’re working on (and yes, that really is what you are doing here — your simple little commit message just turned into a file…).</li><li>Write your commit message on the first line.</li><li>Hit&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">esc</code>. This will return you to ‘normal’ mode.</li><li>Type&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">:wq</code>. It’s important that you type the colon or it won’t work — apparently this is a throwback from earlier days. The&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">w</code>&nbsp;stands for ‘write’, i.e. save and the&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">q</code>&nbsp;for ‘quit’ — so basically, save and quit.</li></ol><p><img src="https://cdn-images-1.medium.com/max/1600/1*pC4tNk3XRyrrCCV_8BwNyQ.png"></p><p>5. Finally, hit&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">enter</code> — and you will be taken back to your normal terminal window.</p><p>And that really is it!</p><p><br></p><p>[1] Myself included back in the day, which was, like, all of a year ago…</p><p>[2] And actually, it’s not just newbies who experience this trauma. When I told my colleague, a decent mid-level back end dev, compsci grad and everything, that I was writing this post, his comment was ‘Yeah, do it, I still don’t know how to get out of vim’. Though clearly in his case, he ends up in vim for other reasons than getting over-excited with his commits.</p>	2019-05-08 11:58:45.401899	2019-05-10 21:18:22.774038	4 min	how-to-exit-vim-in-5-simple-steps-3	25	4
2	228782-Nick-Vujicic-Quote-Don-t-give-up-on-God-because-God-will-not-give.jpg	Don't Give Up On God	<p>In the uncertainty of modern life, many have given up on the Word. From their point of view, the "shoreline" they've been seeking so desperately is nowhere in sight. They're about to "abandon ship" where faith is concerned. But if we want to experience victory over our trials and troubles,&nbsp;we must learn to esteem the virtues of God's Word.</p><p>THE WORD OF GOD—the Bible—is not just a collection of words and sayings in a sacred book. God's Word, including each word that is written, is the very power of God to those who will believe it (Rom. 1:16). It is a rock we can stand on in troubled times.</p><p>When the tides of change come rolling in and fear seems to be everywhere present, God's Word is a solid, sure foundation that the storm cannot wash away.</p><p>Hold Tightly to Jesus</p><p>Someone might ask, "Reverend Hagin, do you know what's going to happen to our economy?" No, I don't know the future in detail, but I know the One Who does. I don't know what decisions will be made in Washington that will affect our nation and the world. But I know the One Who can change the tides to accomplish His plan and purpose. And my trust is in Him!</p><p>Hebrews 4:14 (NKJV) says,&nbsp;<em>"Seeing then that we have a great High Priest who has passed through the heavens, Jesus the Son of God, let us hold fast our confession." The New International Version says, "Let us hold firmly to the faith we profess."</em></p><p>When the world appears "awash" around us, that is no time to abandon ship! Instead, we must hold on tightly to Jesus. He is with us and has promised He will never leave us, forsake us, or fail us! The&nbsp;<em>Amplified Bible Classic Edition</em>&nbsp;says,&nbsp;<em>"He [God] Himself has said, I will not in any way fail you nor give you up nor leave you without support. [I will] not, [I will] not, [I will] not in any degree leave you helpless nor forsake nor let [you] down (relax My hold on you)! [Assuredly not!]"</em>&nbsp;(Heb. 13:5).</p><p>Whatever we're going through, Jesus knows about it. And unlike other religions of the world, He is&nbsp;<em>with</em>&nbsp;us. He's not in a tomb! He's alive forevermore! He is in us and for us!</p><p>Not only that, but Hebrews 7:24–25 says Jesus is ever interceding on our behalf. That alone should embolden us to hold fast to our confession of faith in Him. We can have immovable, unshakable confidence that He will steady us, strengthen us, and calm every storm. He will be our Anchor, our steadfast hope, on the rolling tides and crashing waves. He will see us safely through the storm and guide us to our destination.</p><p>God's Word Will Not Fail Us</p><p>It's important for us to realize that after we've prayed, an apparent delay in the answer doesn't mean that God hasn't heard us. It doesn't mean that help is not on the way! First John 5:14–15 (NKJV) says,&nbsp;<em>"Now this is the confidence that we have in Him, that if we ask anything according to His will, HE HEARS US. And IF WE KNOW THAT HE HEARS US, whatever we ask, WE KNOW THAT WE HAVE THE PETITIONS THAT WE HAVE ASKED OF HIM."</em>God's Word will not fail us if we'll refuse to give up.</p><p>Someone once said to me, "I've been believing God for so long!" I encouraged this person, "Don't quit! Your faith will see you through if you won't give up! Keep standing on the rock of God's Word. It's a sure Word, and it won't let you down!"</p><p>You see, when we fail to receive something that God has promised in His Word, it's because we didn't approach Him in faith, or we abandoned our faith too soon.</p><p>Remember the disciples at sea in their storm-tossed ship? Jesus calmed the storm and then asked them, "How is it that you have no faith?" (Mark 4:40). Because of the fierce circumstances, they had abandoned faith in Jesus' words: "Let us cross over to the other side" (v. 35). Those words were powerful enough to see them through any storm, but they didn't "hold fast" to those living, power-filled words.</p><p>I wonder how many people have "abandoned ship" and let go of their faith when the answer was just around the corner. In another storm, Jesus walked on the water to the disciples' ship as they battled the elements. Some researchers say that particular body of water was only about four miles wide at its narrowest point. If that's true, when the storm was at its worst, the disciples could have been less than a half mile or&nbsp;<em>even just a few yards&nbsp;</em>from their destination!</p><p>Friend, your ship may be storm-tossed and battered, but you may be closer to land than you think! The devil may be shouting,&nbsp;<em>You'll never win!</em>&nbsp;But God has victory in store for you!</p><p>You do not have to cave in or surrender to fear. You do not have to draw back and relinquish your hold on what God has promised. You don't have to abandon the command of your ship to Satan. And you don't have to "jump ship"!</p><p>Run to the Word of God. Realize that the Lord will never leave you and that you're never out of His reach or His care. Don't abandon ship just before you reach the shore! No matter how rough the storm or uncertain the times, if you'll hold fast to your confession of faith in God's Word, every step that you take in faith will draw you closer to your promised victory!</p><p><br></p>	2019-05-08 06:40:54.695813	2019-05-10 21:13:05.272431	5 min	don't-give-up-on-god-2	28	2
1	1384747-Jil-Sander-Quote-Life-is-full-of-challenges-and-surprises.jpg	Life Is Full Of Surprises	<p class="ql-align-justify">As you may have read in my recent post, I just went through a major change of plans. More specifically, I lost a significant source of my income. But apparently the Universe wasn’t done with me yet. In the days that followed, I contracted strep throat, got into a car accident, and was bit by a tick. Yes, life is full of challenges.</p><p class="ql-align-justify">Was this a streak of bad luck? I don’t believe there is such a thing. I believe that from time to time, the Universe throws us a test, a challenge. It’s life’s way of reminding us that we’re still alive. To shake us out of our&nbsp;<a href="http://simplerlifetoday.com/time-to-start-getting-out-of-your-comfort-zone/" target="_blank" style="color: rgb(48, 136, 255);">comfort zone</a>, to force us to evolve a little more. To see how far we can stretch.</p><p class="ql-align-justify">The challenges of life vary greatly. From a bad hair day, to stopping just short of a disaster. But no matter how horrible these challenges may be, they are a way for us to learn something new about ourselves. To grow and evolve as spiritual beings.</p><p class="ql-align-justify">Imagine for a moment life devoid of any challenge. Just an effortless existence, one sunny day after next. No reason to strive for anything, accomplish anything, to learn or excel. This life would end just as it began, without a meaning. Without a purpose. What would be the point of this life?</p><p class="ql-align-justify">True, we don’t always have a choice in what challenges we face. But perhaps that’s a part of the Divine plan. The unknown, the unexpected. This is what makes it a challenge. When life throws a challenge at you, remember that you’re still alive, and treat this challenge as an opportunity.</p><p class="ql-align-justify"><strong>1.&nbsp;</strong><a href="http://simplerlifetoday.com/how-to-breathe/" target="_blank" style="color: rgb(48, 136, 255);"><strong>Breathe</strong></a></p><p class="ql-align-justify">Stop and breath. This one is essential. When life is a challenge, when you’re overwhelmed and stressed out, breathe. Intentional breathing will help you to calm down and center yourself. It will let you release the stress and allow you to focus. Breathing will bring you back to the present.</p><p class="ql-align-justify"><strong>2. Let Negative Energy Pass</strong></p><p class="ql-align-justify">Sometimes, a painful challenge will create a buildup of negative energy associated with it. Rather than jumping in head first, allow the negative energy to pass. When I feel the presence of negative energy around me, I resort to an age old tradition of lighting up a candle and placing it next to a bowl of fresh water to clear it up.</p><p class="ql-align-justify">You can also pray,&nbsp;<a href="http://simplerlifetoday.com/learn-how-to-meditate/" target="_blank" style="color: rgb(48, 136, 255);">meditate</a>,&nbsp;<a href="http://simplerlifetoday.com/how-to-get-motivated-to-exercise/" target="_blank" style="color: rgb(48, 136, 255);">exercise</a>, do yoga, or just go for a long walk by yourself. Wait it out, until you feel that it’s safe to proceed. Without your resistance, the negative energy will naturally dissipate after a short time.</p><p class="ql-align-justify"><strong>3. Do Your Best</strong></p><p class="ql-align-justify">When the time comes to take action, do the best you can. This means doing whatever you are naturally capable of, to resolve the situation. You can not do better than your best. Trust yourself. Do not second guess yourself. If you make the decisions from your heart, they will be the best ones under the circumstances. Remain positive.</p><p class="ql-align-justify"><strong>4. The Test Will Pass</strong></p><p class="ql-align-justify">This is a test. This is life’s way of saying – if I throw this at you, what will you do? How will you react? Will you run away and hide, or will you exercise your resolve and make the best out of the situation? No matter what, it’s just a cycle, just a stage. And this test will pass.</p><p class="ql-align-justify"><strong>In Conclusion</strong></p><p class="ql-align-justify">Reflect, reflect, reflect… Even before the challenge is resolved, think about why you were given this challenge. Often, it will make sense. It will be a natural correction in your life’s path. The challenges are given for a reason. The painful ones are those that we need the most to get us to that new chapter in life. Offer us a rebirth. To help us shed our skin, so we can grow it back shinier than ever!</p><p>Live well. Vlad</p><p><br></p>	2019-05-07 16:16:40.800438	2019-05-10 21:15:36.525188	4 min	life-is-full-of-surprises-1	60	1
10	Millionaire.jpg	Get Rich !	<p><span style="color: rgb(34, 34, 34);">From&nbsp;</span><a href="https://en.wikipedia.org/wiki/Middle_English" target="_blank" style="color: rgb(34, 34, 34);">Middle English</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/riche#Middle_English" target="_blank" style="color: rgb(34, 34, 34);"><em>riche</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“strong, powerful, rich”), from&nbsp;</span><a href="https://en.wikipedia.org/wiki/Old_English" target="_blank" style="color: rgb(34, 34, 34);">Old English</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/rice#Old_English" target="_blank" style="color: rgb(34, 34, 34);"><em>rīċe</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“powerful, mighty, great, high-ranking, rich, wealthy, strong, potent”), from&nbsp;</span><a href="https://en.wikipedia.org/wiki/Proto-Germanic_language" target="_blank" style="color: rgb(34, 34, 34);">Proto-Germanic</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/Reconstruction:Proto-Germanic/r%C4%ABkijaz" target="_blank" style="color: rgb(34, 34, 34);"><em>*rīkijaz</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“powerful, rich”), probably from&nbsp;</span><a href="https://en.wikipedia.org/wiki/Proto-Celtic_language" target="_blank" style="color: rgb(34, 34, 34);">Proto-Celtic</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/w/index.php?title=Reconstruction:Proto-Celtic/r%C4%ABgos&amp;action=edit&amp;redlink=1" target="_blank" style="color: rgb(34, 34, 34);"><em>*rīgos</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“of a ruler or king”,&nbsp;genitive case), from&nbsp;</span><a href="https://en.wikipedia.org/wiki/Proto-Indo-European_language" target="_blank" style="color: rgb(34, 34, 34);">Proto-Indo-European</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/Reconstruction:Proto-Indo-European/h%E2%82%83re%C7%B5-" target="_blank" style="color: rgb(34, 34, 34);"><em>*h₃reǵ-</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“to straighten, direct, make right”). Cognate with Scots&nbsp;</span><a href="https://en.wiktionary.org/wiki/rik#Scots" target="_blank" style="color: rgb(34, 34, 34);"><em>rik</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“mighty, great, noble, rich”), Saterland Frisian&nbsp;</span><a href="https://en.wiktionary.org/wiki/riek#Saterland_Frisian" target="_blank" style="color: rgb(34, 34, 34);"><em>riek</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”),&nbsp;</span><a href="https://en.wikipedia.org/wiki/West_Frisian_language" target="_blank" style="color: rgb(34, 34, 34);">West Frisian</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/ryk#West_Frisian" target="_blank" style="color: rgb(34, 34, 34);"><em>ryk</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”),&nbsp;</span><a href="https://en.wikipedia.org/wiki/Dutch_language" target="_blank" style="color: rgb(34, 34, 34);">Dutch</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/rijk#Dutch" target="_blank" style="color: rgb(34, 34, 34);"><em>rijk</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”),&nbsp;</span><a href="https://en.wikipedia.org/wiki/German_language" target="_blank" style="color: rgb(34, 34, 34);">German</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/reich#German" target="_blank" style="color: rgb(34, 34, 34);"><em>reich</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”),&nbsp;</span><a href="https://en.wikipedia.org/wiki/Danish_language" target="_blank" style="color: rgb(34, 34, 34);">Danish</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/rig#Danish" target="_blank" style="color: rgb(34, 34, 34);"><em>rig</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”),&nbsp;</span><a href="https://en.wikipedia.org/wiki/Icelandic_language" target="_blank" style="color: rgb(34, 34, 34);">Icelandic</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/r%C3%ADkur#Icelandic" target="_blank" style="color: rgb(34, 34, 34);"><em>ríkur</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”),&nbsp;</span><a href="https://en.wikipedia.org/wiki/Norwegian_language" target="_blank" style="color: rgb(34, 34, 34);">Norwegian</a><span style="color: rgb(34, 34, 34);">&nbsp;and&nbsp;</span><a href="https://en.wikipedia.org/wiki/Swedish_language" target="_blank" style="color: rgb(34, 34, 34);">Swedish</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/rik#Swedish" target="_blank" style="color: rgb(34, 34, 34);"><em>rik</em></a><span style="color: rgb(34, 34, 34);">&nbsp;(“rich”). The Middle English word was reinforced by&nbsp;</span><a href="https://en.wikipedia.org/wiki/Old_French" target="_blank" style="color: rgb(34, 34, 34);">Old French</a><span style="color: rgb(34, 34, 34);">&nbsp;</span><a href="https://en.wiktionary.org/wiki/riche#Old_French" target="_blank" style="color: rgb(34, 34, 34);"><em>riche</em></a><span style="color: rgb(34, 34, 34);">, from the same Proto-Germanic root.</span></p>	2019-06-17 22:14:27.495508	2019-06-17 22:14:27.526705	2 min	get-rich-!-10	11	6
9	keanu-reeves-john-wick-chapter-3-parabellum.jpg	John Wick-3 Review	<p>We know by now that John Wick (Keanu Reeves, wearing stubble and an increasingly machete‑slashed black suit) is not in the business of taking prisoners. And neither, it seems, is the production design team of this riotous, relentless third instalment. It’s not just the violence that’s excessive. Pretty much every frame is a flying kick to the senses. The distinctive aesthetic – a kind of hi-tech baroque, with a touch of fetishy transgression for good measure – is not the only reason that this action series punches above its weight. But it is a significant factor. After all, a fight scene is a fight scene is a fight scene, even one featuring some of the most highly skilled martial arts practitioners in the world (look out for purveyors of Indonesian tower-block carnage from&nbsp;<a href="https://www.theguardian.com/film/2012/may/20/the-raid-redemption-review" target="_blank" style="color: rgb(0, 123, 255);">The Raid</a>). But put a fight scene in a room stacked with antique ceremonial knives, or in a glass room displaying nothing but crystal skulls, and there’s a whole new level of spectacle to be explored. And spectacle, rather than internal logic, has always been what the John Wick movies do best.</p><p><br></p><p><img src="https://i.guim.co.uk/img/media/67fed3b1068487f67df01309c30676976565e408/0_0_3999_2400/master/3999.jpg?width=460&amp;quality=85&amp;auto=format&amp;fit=max&amp;s=fdba7ca6f7a200d7e9cb20581e9fdc6f"></p><h2>Sign up to our Film Today email</h2><p>&nbsp;Read more</p><p><em>Chapter 3</em>&nbsp;takes over where the second film left off, with the whole of New York a ticking clock counting down the minutes until Wick is rendered “excommunicado”. Once his status is officially downgraded, he becomes persona non grata within the shadowy underworld governed by the criminal council the High Table. More importantly, there’s a $14m bounty on his head. Even so, Wick manages to trade on his birthright to beg a favour from ballet mistress and gang boss the Director (Anjelica Huston, all languid cruelty and sneered lines). The favour sends Wick to Casablanca, and the weakest segment of the movie involving Halle Berry, dog peril and a wearisome gunfight. Wick is a man who can kill a 7ft assassin using just a library book. Seeing him scurrying around a Moroccan bazaar brandishing a firearm seems rather basic. Fortunately, he’s soon back on US soil doing what he does best – dispatching his foes in a variety of creatively agonising methods. “Art is pain. Life is suffering,” growls Huston. But the latest instalment of John Wick makes an art of pain in a way that is curiously life-affirming.</p>	2019-05-27 16:55:07.969311	2019-05-27 16:55:07.973805	2 min	john-wick-3-review-9	13	1
7	Screen_Shot_2019-02-18_at_11.47.28_AM.png	Ruby Programming/Syntax/Literals	<p>Numerics</p><pre spellcheck="false">123                       # Fixnum\r\n-123                      # Fixnum (signed)\r\n1_123                     # Fixnum (underscore is ignored)\r\n-543                      # Negative Fixnum\r\n123_456_789_123_456_789   # Bignum\r\n123.45                    # Float\r\n1.2e-3                    # Float\r\n123.45r                   # Rational, introduced in ruby 2.1\r\n0xaabb                    # (Hexadecimal) Fixnum\r\n0377                      # (Octal) Fixnum\r\n-0b1010                   # (Binary [negated]) Fixnum\r\n0b001_001                 # (Binary) Fixnum\r\n?a                        # ASCII character code for 'a' (97)\r\n?\\C-a                     # Control-a (1)\r\n?\\M-a                     # Meta-a (225)\r\n?\\M-\\C-a                  # Meta-Control-a (129)\r\n</pre><p>Note: the meaning of "?x" notation has been changed. In ruby 1.9 this means not an ASCII numeric code but a string i.e. ?a == "a"</p><h2>Strings<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=2" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h2><p>Examples:</p><pre spellcheck="false">"this is a string"\r\n=&gt; "this is a string"\r\n\r\n"three plus three is #{3+3}"\r\n=&gt; "three plus three is 6" \r\n\r\nfoobar = "blah"\r\n"the value of foobar is #{foobar}"\r\n=&gt; "the value of foobar is blah" \r\n\r\n'the value of foobar is #{foobar}'\r\n=&gt; "the value of foobar is \\#{foobar}"\r\n</pre><p>A string expression begins and ends with a double or single-quote mark. Double-quoted string expressions are subject to backslash notation and interpolation. A single-quoted string expression isn't; except for \\' and \\\\.</p><h3>Backslash Notation<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=3" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h3><p>Also called&nbsp;<em>escape characters</em>&nbsp;or&nbsp;<em>escape sequences</em>, they are used to insert special characters in a string.</p><p>Example:</p><pre spellcheck="false">"this is a\\ntwo line string"\r\n"this string has \\"quotes\\" in it"\r\n</pre><p><strong>Escape SequenceMeaning</strong>\\nnewline (0x0a)\\sspace (0x20)\\rcarriage return (0x0d)\\ttab (0x09)\\vvertical tab (0x0b)\\fformfeed (0x0c)\\bbackspace (0x08)\\abell/alert (0x07)\\eescape (0x1b)\\nnncharacter with octal value&nbsp;nnn\\xnncharacter with hexadecimal value&nbsp;nn\\unnnnUnicode code point U+nnnn (Ruby 1.9 and later)\\u{nnnnn}Unicode code point U+nnnnn with more than four hex digits must be enclosed in curly braces\\cxcontrol-x\\C-xcontrol-x\\M-xmeta-x\\M-\\C-xmeta-control-x\\xcharacter&nbsp;x&nbsp;itself (for example \\" is the double quote character)For characters with decimal values, you can do this:</p><p><code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">"" &lt;&lt; 197 # add decimal value 197 to a string</code></p><p><code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">=&gt; Å</code></p><p>or embed them thus:</p><p><code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">"#{197.chr}"</code></p><h3>Interpolation<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=4" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h3><p>Interpolation allows Ruby code to appear within a string. The result of evaluating that code is inserted into the string:</p><pre spellcheck="false"> "1 + 2 = #{1 + 2}"    # =&gt; "1 + 2 = 3"\r\n #{expression}\r\n</pre><p>The expression can be just about any Ruby code. Ruby is pretty smart about handling string delimiters that appear in the code and it generally does what you want it to do. The code will have the same side effects as it would outside the string, including any errors:</p><pre spellcheck="false">"the meaning of life is #{1/0}"\r\n=&gt; divided by 0 (ZeroDivisionError)\r\n</pre><h3>The&nbsp;% Notation<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=5" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h3><p>There is also a Perl-inspired way to quote strings: by using&nbsp;% (percent character) and specifying a delimiting character, for example:</p><pre spellcheck="false">%{78% of statistics are "made up" on the spot}\r\n=&gt; "78% of statistics are \\"made up\\" on the spot"\r\n</pre><p>Any single non-alpha-numeric character can be used as the delimiter,&nbsp;%[including these],&nbsp;%?or these?,&nbsp;%~or even these things~. By using this notation, the usual string delimiters " and ' can appear in the string unescaped, but of course the new delimiter you've chosen does need to be escaped. However, if you use&nbsp;%(parentheses),&nbsp;%[square brackets],&nbsp;%{curly brackets}&nbsp;or&nbsp;%&lt;pointy brackets&gt;&nbsp;as delimiters then those same delimiters can appear&nbsp;<em>unescaped</em>&nbsp;in the string as long as they are in&nbsp;<em>balanced</em>&nbsp;pairs:</p><pre spellcheck="false">%(string (syntax) is pretty flexible)\r\n=&gt; "string (syntax) is pretty flexible"\r\n</pre><p>A modifier character can appear after the&nbsp;%, as in %q[], %Q[], %x[] - these determine how the string is interpolated and what type of object is produced:</p><p><strong>ModifierMeaning</strong>%q[ ]Non-interpolated String (except for&nbsp;<code style="color: rgb(0, 0, 0);">\\\\</code>,&nbsp;<code style="color: rgb(0, 0, 0);">\\[</code>, and&nbsp;<code style="color: rgb(0, 0, 0);">\\]</code>)%Q[ ]Interpolated String (default)%r[ ]Interpolated Regexp (flags can appear after the closing delimiter)%i[ ]Non-interpolated Array of symbols, separated by whitespace (after Ruby 2.0)%I[ ]Interpolated Array of symbols, separated by whitespace (after Ruby 2.0)%w[ ]Non-interpolated Array of words, separated by whitespace%W[ ]Interpolated Array of words, separated by whitespace%x[ ]Interpolated shell command%s[ ]Non-interpolated symbolHere are some more examples:</p><pre spellcheck="false">%Q{one\\ntwo\\n#{ 1 + 2 }}\r\n=&gt; "one\\ntwo\\n3"\r\n\r\n%q{one\\ntwo\\n#{ 1 + 2 }}\r\n=&gt; "one\\\\ntwo\\\\n#{ 1 + 2 }"\r\n\r\n%r/#{name}/i\r\n=&gt; /nemo/i\r\n\r\n%w{one two three}\r\n=&gt; ["one", "two", "three"]\r\n\r\n%i{one two three} # after Ruby 2.0\r\n=&gt; [:one, :two, :three]\r\n\r\n%x{ruby --copyright}\r\n=&gt; "ruby - Copyright (C) 1993-2009 Yukihiro Matsumoto\\n"\r\n</pre><h3>"Here document" notation<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=6" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h3><p>There is yet another way to make a string, known as a 'here document', where the delimiter itself can be any string:</p><pre spellcheck="false">string = &lt;&lt;END\r\non the one ton temple bell\r\na moon-moth, folded into sleep,\r\nsits still.\r\nEND\r\n</pre><p>The syntax begins with &lt;&lt; and is followed immediately by the delimiter. To end the string, the delimiter appears alone on a line.</p><p>There is a slightly nicer way to write a here document which allows the ending delimiter to be indented by whitespace:</p><pre spellcheck="false">string = &lt;&lt;-FIN\r\n           on the one-ton temple bell\r\n           a moon-moth, folded into sleep\r\n           sits still.\r\n\r\n           --Taniguchi Buson, 18th century; translated by X. J. Kennedy\r\n         FIN\r\n</pre><p>To use non-alpha-numeric characters in the delimiter, it can be quoted:</p><pre spellcheck="false">string = &lt;&lt;-"."\r\n           Orchid - breathing\r\n           incense into\r\n           butterfly's wings.\r\n\r\n           --Matsuo Basho; translated by Lucien Stryk\r\n         .\r\n</pre><p>Here documents are interpolated,&nbsp;<em>unless you use single quotes around the delimiter</em>.</p><p>The rest of the line after the opening delimiter is not interpreted as part of the string, which means you can do this:</p><pre spellcheck="false">strings = [&lt;&lt;END, "short", "strings"]\r\na long string\r\nEND\r\n\r\n=&gt; ["a long string\\n", "short", "strings"]\r\n</pre><p>You can even "stack" multiple here documents:</p><pre spellcheck="false">string = [&lt;&lt;ONE, &lt;&lt;TWO, &lt;&lt;THREE]\r\n  the first thing\r\nONE\r\n  the second thing\r\nTWO\r\n  and the third thing\r\nTHREE\r\n\r\n=&gt; ["the first thing\\n", "the second thing\\n", "and the third thing\\n"]\r\n</pre><h2>Command Expansion<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=7" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h2><p><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Information_icon4.svg/40px-Information_icon4.svg.png" height="40" width="40"></p><h2>This section is empty. Please help by&nbsp;<a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit" target="_blank" style="color: rgb(102, 51, 102);">expanding it</a>.Regular Expressions<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=8" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h2><pre spellcheck="false">regex_one = /chapter_\\d+/i #=&gt; /chapter_\\d+/i\r\nregex_two = %r(/chapter_\\d+)i #=&gt; /\\/chapter_\\d+/i\r\n</pre><h2>Arrays<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=9" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h2><p>An array is a collection of objects indexed by a non-negative integer. You can create an array object by writing&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">Array.new</code>, by writing an optional comma-separated list of values inside square brackets, or if the array will only contain string objects, a space-delimited string preceded by&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">%w</code>.</p><pre spellcheck="false">array_one   = Array.new\r\narray_two   = []                # shorthand for Array.new\r\narray_three = ["a", "b", "c"]   # array_three contains "a", "b" and "c"\r\narray_four  = %w[a b c d e f g] # array_four also contains "a", "b" and "c"\r\narray_three[0]                # =&gt; "a"\r\narray_three[2]                # =&gt; "c"\r\narray_four[0]                 # =&gt; "a"\r\n#negative indices are counted back from the end\r\narray_four[-2]                # =&gt; "f"\r\n#[start, count] indexing returns an array of count objects beginning at index start\r\narray_four[1,3]               # =&gt; ["b", "c", "d"]\r\n#using ranges. The end position is included with two periods but not with three\r\narray_four[0..4]              # =&gt; ["a", "b", "c", "d"]\r\narray_four[0...4]             # =&gt; ["a", "b", "c"]\r\n</pre><p>The last method, using&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">%w</code>, is in essence shorthand for the&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">String</code>&nbsp;method&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">split</code>&nbsp;when the substrings are separated by whitespace only. In the following example, the first two ways of creating an array of strings are functionally identical while the last two create very different (though both valid) arrays.</p><pre spellcheck="false"> array_one   = %w'apple orange pear'            # =&gt; ["apple", "orange", "pear"]\r\n array_two   = 'apple orange pear'.split        # =&gt; ["apple", "orange", "pear"]\r\n array_one   == array_two                       # =&gt; true\r\n \r\n array_three = %w'dog:cat:bird'                 # =&gt; ["dog:cat:bird"]\r\n array_four  = 'dog:cat:bird'.split(':')        # =&gt; ["dog", "cat", "bird"]\r\n array_three == array_four                      # =&gt; false\r\n</pre><h2>Hashes<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=10" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h2><p>Hashes are basically the same as arrays, except that a hash not only contains values, but also keys pointing to those values. Each key can occur only once in a hash. A hash object is created by writing&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">Hash.new</code>&nbsp;or by writing an optional list of comma-separated&nbsp;<code style="color: rgb(0, 0, 0); background-color: rgb(248, 249, 250);">key =&gt; value</code>&nbsp;pairs inside curly braces.</p><pre spellcheck="false">hash_one   = Hash.new\r\nhash_two   = {}                             # shorthand for Hash.new\r\nhash_three = {"a" =&gt; 1, "b" =&gt; 2, "c" =&gt; 3} #=&gt; {"a"=&gt;1, "b"=&gt;2, "c"=&gt;3}\r\n</pre><p>Usually&nbsp;<a href="https://en.wikibooks.org/wiki/Ruby_Programming/Reference/Objects/Symbol" target="_blank" style="color: rgb(11, 0, 128);">Symbols</a>&nbsp;are used for Hash keys (allows for quicker access), so you will see hashes declared like this:</p><pre spellcheck="false">hash_sym   = { :a =&gt; 1, :b =&gt; 2, :c =&gt; 3}   #=&gt; {:b=&gt;2, :c=&gt;3, :a=&gt;1}\r\nhash_sym   = { a: 1, b: 2, c: 3}            #=&gt; {:b=&gt;2, :c=&gt;3, :a=&gt;1}\r\n</pre><p>The latter form was introduced in Ruby 1.9.</p><h3>Hash ordering<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=11" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h3><p>Note that with 1.8, iterating over hashes will iterate over the key value pairs in a "random" order. Beginning with 1.9, it will iterate over them in the order they were inserted. Note however, that if you reinsert a key without first deleting it, or change an existing key's value, the key's order in iteration does not change.</p><pre spellcheck="false">&gt;&gt; a = {:a =&gt; 1, :b =&gt; 2, :c =&gt; 3}\r\n=&gt; {:a=&gt;1, :b=&gt;2, :c=&gt;3}\r\n&gt;&gt; a.keys # iterate over, show me the keys\r\n=&gt; [:a, :b, :c]\r\n&gt;&gt; a[:b] = 2\r\n&gt; a.keys\r\n=&gt; [:a, :b, :c] # same order\r\n&gt;&gt; a.delete(:b)\r\n&gt;&gt; a[:b] = 4 # re insert now\r\n=&gt; 4\r\n&gt;&gt; a.keys\r\n=&gt; [:a, :c, :b] # different order\r\n</pre><h2>Ranges<span style="color: rgb(84, 89, 93);">[</span><a href="https://en.wikibooks.org/w/index.php?title=Ruby_Programming/Syntax/Literals&amp;action=edit&amp;section=12" target="_blank" style="color: rgb(11, 0, 128);">edit</a><span style="color: rgb(84, 89, 93);">]</span></h2><p>A&nbsp;<strong>range</strong>&nbsp;represents a subset of all possible values of a type, to be more precise, all possible values between a start value and an end value.</p><p>This may be:</p><ul><li>All integers between 0 and 5.</li><li>All numbers (including non-integers) between 0 and 1, excluding 1.</li><li>All characters between 't' and 'y'.</li></ul><p>In Ruby, these ranges are expressed by:</p><pre spellcheck="false">0..5\r\n0.0...1.0\r\n't'..'y'\r\n</pre><p>Therefore, ranges consist of a start value, an end value, and whether the end value is included or not (in this short syntax, using two . for including and three . for excluding).</p><p>A range represents a set of values, not a sequence. Therefore,</p><pre spellcheck="false">5..0\r\n</pre><p>though syntactically correct, produces a range of length zero.</p><p>Ranges can only be formed from instances of the same class or subclasses of a common parent, which must be Comparable (implementing &lt;=&gt;).</p><p>Ranges are instances of the Range class, and have certain methods, for example, to determine whether a value is inside a range:</p><pre spellcheck="false">r = 0..5\r\nputs r === 4  # =&gt; true\r\nputs r === 7  # =&gt; false\r\n</pre><p><br></p>	2019-05-19 15:02:15.220413	2019-07-16 11:23:36.949414	9 min	ruby-programming/syntax/literals-7	10	4
6	Screen_Shot_2019-02-18_at_5.20.50_PM.png	Pagination in Rails and how to implement go to page functionality	<p>Customization of&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">will_paginate</code>&nbsp;gem</p><p><br></p><p>On web pages, sometimes you have many rows of information, lets say: a list of users on the system. In that situation having all the users listed on the same page is not very usable. For that we use pagination that allow us to divide the rows on several pages and order them based on date, name or other field.</p><p>On Rails applications one of the most common used gems is&nbsp;<a href="https://github.com/mislav/will_paginate" target="_blank" style="background-color: rgba(0, 0, 0, 0.05); color: inherit;"><code>will_paginate</code></a>. This gem is very easy to implement but have some limitations. Some of the limitations that we found are the ability to use Ajax to only render the changed rows of the data and how to&nbsp;go to an specific page functionality. Solving these two limitations is the purpose of this post.</p><h3>How to use will_paginate</h3><p>Like most gems needed in a project, we add it to the Gemfile:</p><p><br></p><pre spellcheck="false">## Gemfile for Rails 3+\r\ngem 'will_paginate', '~&gt; 3.1.1'\r\ngem 'will_paginate-bootstrap' \r\n#this is needed to add bootsrap style to pagination\r\n</pre><p>There are important parameters to setup to manage the pagination:</p><ul><li><code style="background-color: rgba(0, 0, 0, 0.05);">per_page</code>: number of items to display on each page.</li><li><code style="background-color: rgba(0, 0, 0, 0.05);">page</code>: the page that will be displayed initially when we load the page.</li></ul><p>Example:&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">Item.paginate page: params[:page], per_page: 10</code></p><p>In the view that we require this functionality, we add the navigation bar:</p><pre spellcheck="false">#erb files\r\n&lt;%= will_paginate @items , renderer: RemoteLinkPagination::LinkRenderer %&gt;\r\n-# haml files\r\n= will_paginate @items, renderer: RemoteLinkPagination::LinkRenderer\r\n# On both cases we are using a custom renderer implemented to\r\n# satisfy our needs. Keep reading to understand why\r\n</pre><p><br></p><p>where&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">@items</code>&nbsp;has all the information that will be displayed as rows in your page.</p><p>Also take into account that we are using an overridden version of LinkRenderer, it will helps to:</p><p>a) Allow&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">will_paginate</code>&nbsp;to use Ajax, and</p><p>b) Be able to generate the go to page functionality.</p><p>If you use bootstrap in your Rails application you will have some nice styles applied to the navigation bar. The navigation bar has several buttons that allow you to go to the page you want and has an ellipsis to denote middle pages that looks like this:</p><p><img src="https://cdn-images-1.medium.com/max/1440/0*JHc7YWb2-XPo0-_A."></p><p>Example of pagination with bootstrap styles&nbsp;applied.</p><h3>Ajax functionality</h3><p>Since we are using rails and the default configuration is to capture all data-remote links, we just need to include&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">data-remote=true</code>&nbsp;to the links generated by&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">will_paginate</code>. To accomplish that we should override the<code style="background-color: rgba(0, 0, 0, 0.05);">link</code>&nbsp;method with the following code:</p><p><br></p><pre spellcheck="false">def link(text, target, attributes = {})\r\n  attributes['data-remote'] = true\r\n  super\r\nend\r\n</pre><p>After that we should create a&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">.js</code>&nbsp;view that renders the data that we want to replace in the general view with something like:</p><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://medium.com/media/6accda3be20d5e554de0030e5fa65a99?postId=3218cef6db43" height="250" width="700"></iframe><p><br></p><h3>Go to page functionality</h3><p>When the number of pages is too high, navigation buttons only permit to go to pages that are numbered in them. But, sometimes we want to go to a specific page, lets say in the above example page 211. To solve this, we implemented the following functionality:</p><p><br></p><p>When clicking on the ellipsis, a textbox will be displayed to enter the page number we want to go.</p><h4>Implementation</h4><p>First we need to create a file under the&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">lib</code>&nbsp;directory called&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">remote_link_pagination.rb</code>&nbsp;and create a module called&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">RemoteLinkPagination</code>. Then you need to overwrite the&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">gap</code>&nbsp;function to add a data identificator:</p><p><br></p><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://medium.com/media/b769d54ff25c5555f5e35e1ee9624793?postId=3218cef6db43" height="250" width="700"></iframe><p><br></p><p>After that we need to add some javascript code to set a new page parameter. In this case, add add a file called&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">paginator.js</code>&nbsp;under&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">app/assets/javascripts</code>&nbsp;folder and write the following code:</p><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://medium.com/media/8c005f266eebf4ec5e5ad816dcb18416?postId=3218cef6db43" height="250" width="700"></iframe><p><br></p><p>We also need to add in<code style="background-color: rgba(0, 0, 0, 0.05);">config/application.rb</code>&nbsp;the following:</p><pre spellcheck="false">config.autoload_paths &lt;&lt; Rails.root.join(‘lib’)\r\n</pre><p>inside application class.</p><p>And voilà, the final result should look something like this:</p><p><img src="https://cdn-images-1.medium.com/max/1440/1*tcQbjDBUBJza_oBv79g-vg.gif"></p><p><br></p>	2019-05-19 14:25:27.283386	2019-05-19 14:25:27.329458	4 min	pagination-in-rails-and-how-to-implement-go-to-page-functionality-6	14	1
5	Ajax-celebrate.jpg	The Secrets Behind Ajax's Incredible Champions League Journey.	<p>Ajax are this season's football fairytale—a team with amazing ability and, seemingly, no boundary to their limitations.</p><p>They have become every neutral's favourite side. Their UEFA Champions League journey has brought joy and romance to a competition that can so often feel elitist and predictable.</p><p>At the start of this season, most fans outside of Amsterdam would have struggled to name their players, yet now they roll off the tongue. Frenkie de Jong, Matthijs de Ligt, Hakim Ziyech, David Neres...the football world is falling in love with them.</p><p>They have knocked out Real Madrid and they have seen off Juventus. Next up, they face Tottenham Hotspur in the semi-finals.</p><p>So how did this happen? We know they have an incredible, rich history thanks to traditions ingrained in their DNA through the coaching principles of Johan Cruyff and Rinus Michels, but this reemergence has come very suddenly.&nbsp;</p><p>They have not even won the Eredivisie since 2014, and their most recent European success came in 1995. We spoke to some influential and knowledgeable figures around the club to get an idea of how this young, fun crop of players from the Netherlands have stunned the giants of Europe.&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>BECOMING 'EUROPE-PROOF'</p><p>Trusting their academy talent is a great trait, but the vision has been altered in recent times to boost their chances of competing both domestically and on the European stage.&nbsp;</p><p><a href="https://twitter.com/DuBlanqeBogarde" target="_blank" style="color: rgb(63, 5, 224);">@DuBlanqeBogarde</a>&nbsp;is a well-informed Ajax pundit on Twitter, followed by both journalists and supporters.&nbsp;</p><p>"International media have focused on the huge differences in budgets between Ajax and their opponents, which makes sense to a certain degree because the difference really is huge," he told B/R.&nbsp;</p><p>"However, it's worth noting that Ajax has actually been investing quite heavily, compared to recent years and other teams in the Eredivisie. During last season, boss Erik ten Hag and director of football Marc Overmars made an analysis of the squad and tried to identify what was needed to make Ajax 'Europe-proof,' so to speak.&nbsp;</p><p>"They realised they were missing some more experienced players in their late 20s, guys that know what it takes to win in international football and guys that still have something prove. That's why they spent big on Dusan Tadic and Daley Blind and increased wages to attract and keep good players.&nbsp;</p><p>"Young talent alone is not enough, as talent needs guidance and leadership on and off the pitch."&nbsp;</p><p><a href="https://twitter.com/Zlajan" target="_blank" style="color: rgb(63, 5, 224);">Jan&nbsp;Verdonk</a>&nbsp;is an ardent Ajax supporter who never misses a game, and explained: "A changed financial situation in European football has changed things. I think Ajax has profited from the expansion of financial power at a lot of clubs in European football. For example, when Arkadiusz<em>&nbsp;</em>Milik went to Napoli for&nbsp;€34 million. I don't think this was possible 10 years ago.&nbsp;</p><p>"It is also worth noting the changed contract policy for youth players. Ajax initially refused to give contracts to 16-year-old players—they waited until they were 17. Because of this, players like Timothy Fosu-Mensah and Javairo Dilrosun left the club. Ajax changed this policy a couple of years ago, which means 16-year-old talents do get a contract now. Less players leave the club now, and this really was an important decision."</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>MANAGERIAL NOUS</p><p>Ten Hag arrived from Utrecht in 2017, and it has certainly not been plain sailing.</p><p>"I called him Bootleg Pep when he first started," admits DuBlanqeBogarde. "That was a joke, meant as a slight insult to a coach that, to me, felt like a poor man's Guardiola. I have to take it all back, because he actually is a tactical genius.</p><p>"His determination, vision and absolutely insane dedication in striving for perfection has given the players the tools they need to excel, without losing the freedom to trust their instinct and the feeling they're playing with their friends in the park on a Saturday afternoon.</p><p class="ql-align-center"><br></p><p>"He demands 24/7 dedication of his players but isn't blind or deaf to their ideas—he even encourages it. Players and staff seem to have clicked in a way that creates a 'Yeah, we beat Juve 1-2, but it should have been 1-4' mentality, in a good way."&nbsp;</p><p>Michael Bell of&nbsp;<a href="https://twitter.com/FootballOranje_" target="_blank" style="color: rgb(63, 5, 224);">Football-Oranje.com</a>&nbsp;hopes the coach begins to become more recognised.&nbsp;"He&nbsp;went into the campaign under some pressure—because he didn't really know his best 11," he told B/R.</p><p>"Frenkie de Jong wasn't even a guaranteed starter, and performances early on weren't great. However, I think the confidence the results in the Champions League group stage brought has been behind this run. They showed they could go toe-to-toe with Bayern Munich, and that has allowed them to play with no fear against the big sides.</p><p>"Ten Hag is not getting a lot of credit for his European record. With Ajax and Utrecht, he has only lost two out of 22 matches in Europe. A lot more should be getting said about how he has turned his tenure at Ajax around."</p>	2019-05-08 12:36:20.654916	2019-05-10 21:16:01.814829	5 min	the-secrets-behind-ajax's-incredible-champions-league-journey--5	30	1
17	\N	Why You Should Study Philosophy	<p>“Philosophy” comes from Greek words meaning “love of wisdom.”&nbsp;Philosophy uses the tools of logic and reason to analyze the ways in which humans experience the world.&nbsp;It teaches critical thinking, close reading, clear writing, and logical analysis; it uses these to understand the language we use to describe the world, and our place within it.&nbsp;Different areas of philosophy are distinguished by the questions they ask.&nbsp;Do our senses accurately describe reality?&nbsp;What makes wrong actions wrong?&nbsp;How should we live?&nbsp;These are philosophical questions, and philosophy teaches the ways in which we might begin to answer them.</p><p><br></p><p>Students who learn philosophy get a great many benefits from doing so.&nbsp;The tools taught by philosophy are of great use in further education, and in employment.&nbsp;Despite the seemingly abstract nature of the questions philosophers ask, the tools philosophy teaches tend to be highly sought-after by employers.&nbsp;Philosophy students learn how to write clearly, and to read closely, with a critical eye; they are taught to spot bad reasoning, and how to avoid it in their writing and in their work.&nbsp;It is therefore not surprising that philosophy students have historically scored more highly on tests like the LSAT and GRE, on average, than almost any other discipline.&nbsp;Many of our students combine studying philosophy with studying other disciplines.</p><p>The most important reason to study philosophy is that it is of enormous and enduring interest.&nbsp;All of us have to answer, for ourselves, the questions asked by philosophers.&nbsp;In this department, students can learn how to ask the questions well, and how we might begin to develop responses.&nbsp;Philosophy is important, but it is also enormously enjoyable, and our faculty contains many award-winning teachers who make the process of learning about philosophy fun.&nbsp;Our faculty are committed to a participatory style of teaching, in which students are provided with the tools and the opportunity to develop and express their own philosophical views.&nbsp;</p><p><br></p>	2019-06-23 03:06:21.814108	2019-06-23 03:07:18.448151	2 min	why-you-should-study-philosophy-17	8	8
16	image.jpg	10 Tips for Improving Your Public Speaking Skills	<p>Snakes? Fine. Flying? No problem. Public speaking? Yikes! Just thinking about public speaking—routinely&nbsp;described as one of the greatest (and most common) fears—can make your palms sweat. But there are many ways to tackle this anxiety and learn to deliver a memorable speech.</p><p><br></p><p>In part one of this series,&nbsp;<a href="https://www.extension.harvard.edu/professional-development/blog/mastering-basics-communication" target="_blank" style="color: rgb(165, 28, 48);">Mastering the Basics of Communication</a>, I shared strategies to improve how you communicate. In&nbsp;<a href="https://www.extension.harvard.edu/professional-development/blog/how-communicate-more-effectively-workplace" target="_blank" style="color: rgb(165, 28, 48);">part two</a>, I examined how to apply these techniques as you interact with colleagues and supervisors in the workplace. For the third and final part of this series, I’m providing you with public speaking tips that will help reduce your anxiety, dispel myths, and improve your performance.</p><p><br></p><h2>HERE ARE MY 10 TIPS FOR PUBLIC SPEAKING:</h2><p><br></p><p>To improve, challenge your standard approach.</p><h3>1. Nervousness Is Normal. Practice and Prepare!</h3><p><br></p><p>All people feel some physiological reactions like pounding hearts&nbsp;and trembling&nbsp;hands. Do not associate these feelings with the sense that you will perform poorly or make a fool of yourself. Some nerves are good. The adrenaline rush that makes you sweat also makes you more alert and ready to give your best performance.</p><p>The best way to overcome anxiety is to prepare, prepare, and prepare some more. Take the time to go over your notes several times. Once you have become comfortable with the material, practice—a lot. Videotape yourself, or get a friend to critique your performance.</p><p><br></p><h3>2. Know Your Audience. Your Speech Is About Them, Not You.</h3><p>Before you begin to craft your message, consider who the message is intended for. Learn as much about your listeners as you can. This will help you determine your choice of words, level of information, organization pattern, and motivational statement.</p><p><br></p><h3>3. Organize Your Material in the Most Effective Manner to Attain Your Purpose.</h3><p>Create the framework for your speech. Write down the topic, general purpose, specific purpose, central idea, and main points. Make sure to grab the audience’s attention in the first 30 seconds.</p><p><br></p><h3>4. Watch for Feedback and Adapt to It.</h3><p>Keep the focus on the audience. Gauge their reactions, adjust your message, and stay flexible. Delivering a canned speech will guarantee that you lose the attention of or confuse even the most devoted listeners.</p><p><br></p><h3>5. Let Your Personality Come Through.</h3><p>Be yourself, don’t become a talking head—in any type of communication. You will establish better credibility if your personality shines through, and your audience will trust what you have to say if they can see you as a real person.</p><p><br></p><h3>6. Use Humor, Tell Stories, and Use Effective Language.</h3><p>Inject a funny anecdote in your presentation, and you will certainly grab your audience’s attention. Audiences generally like a personal touch in a speech. A story can provide that.</p><p><br></p><h3>7. Don’t Read Unless You Have to. Work from an Outline.</h3><p>Reading from a script or slide fractures the interpersonal connection. By maintaining eye contact with the audience, you keep the focus on yourself and your message. A brief outline can serve to jog your memory and keep you on task.</p><p><br></p><h3>8. Use Your Voice and Hands Effectively. Omit Nervous Gestures.</h3><p>Nonverbal communication carries most of the message. Good delivery does not call attention to itself, but instead conveys the speaker’s ideas clearly and without distraction.</p><p><br></p><h3>9. Grab Attention at the Beginning, and Close with a Dynamic End.</h3><p>Do you enjoy hearing a speech start with “Today I’m going to talk to you about X”? Most people don’t. Instead, use a startling statistic, an interesting anecdote, or concise quotation. Conclude your speech with a summary and a strong statement that your audience is sure to remember.</p><p><br></p><h3>10. Use Audiovisual Aids Wisely.</h3><p>Too many can break the direct connection to the audience, so use them sparingly. They should enhance or clarify your content, or capture and maintain your audience’s attention.</p><p><br></p><h3>Practice Does Not Make Perfect</h3><p>Good communication is never perfect, and nobody expects you to be perfect. However, putting in the requisite time to prepare will help you deliver a better speech. You may not be able to shake your nerves entirely, but you can learn to minimize them.</p>	2019-06-23 02:54:11.716379	2019-06-23 02:54:11.72598	4 min	10-tips-for-improving-your-public-speaking-skills-16	6	7
20	kenneth-omeruo-nigeria-vs-guinea_bjn6u5khznvuzuestvszfiim.jpg	Super Eagles Through To The Round Of 16	<p>The Chelsea loanee was the standout player in a Africa Cup of Nations game where the defences were on top in Alexandria</p><p>As a game, Wednesday’s meeting between&nbsp;<a href="https://www.goal.com/en/team/nigeria/ao3zo8i0kn3grl47nol24gck0" target="_blank" style="color: rgb(0, 169, 206);">Nigeria</a>&nbsp;and Guinea was important without being memorable.</p><p>For the Super Eagles, the slim 1-0 victory qualified them for the&nbsp;<a href="https://www.goal.com/en/africa-cup-of-nations/68zplepppndhl8bfdvgy9vgu1" target="_blank" style="color: rgb(0, 169, 206);">Africa Cup of Nations</a>&nbsp;Round of 16, the first team in the competition to do so. It also stretched to six a winning Afcon run going back six years and three editions ago. Back then, it seemed ludicrous, as Nigeria held the trophy aloft, that it would be their last appearance for over half a decade.</p><p>So, while it certainly was full of implication, the actual game itself was sorely lacking in proper quality. There was some excitement, most notably in the opening 25 minutes when both teams huffed and puffed at each other but their rearguards stood firm.</p><p><br></p><p><span style="background-color: rgb(208, 214, 213);"><img src="https://www.goal.com/rebuild-beta-assets/img/placeholder.4c8c939c77.png" alt="Odion Ighalo - Nigeria vs Seychelles"></span></p><p>Moses Simon began brightly, but by the end even he was an auxiliary winger, first by the coercion of Issiaga Sylla, and then by the persuasion of Gernot Rohr to secure the result. Musa endured an anonymous afternoon, although that was less to do with Mikael Dyrestam’s efforts than his own one-dimensional movement all game long.</p><p>At the other end, the Nigerian defenders had the upper hand as well.</p><p>In a narrow full-back role, Chidozie Awaziem made light work of Francois Kamano’s attempts to get by him and was always perfectly positioned, never needing to overly exert himself. Ola Aina did no moonlighting as a silky creator this time, but is such a thoroughbred athlete that Ibrahima Traore spent large swathes of the game playing inside his own half.</p><p>Sory Kaba, up against an unapologetic defence, wilted in the afternoon sun; Kenneth Omeruo engaged, while Leon Balogun picked off what came through the cracks.</p><p><span style="background-color: rgb(208, 214, 213);"><img src="https://www.goal.com/rebuild-beta-assets/img/placeholder.4c8c939c77.png" alt="Kenneth Omeruo - Nigeria vs. Guinea"></span></p><p>The eternal&nbsp;<a href="https://www.goal.com/en/team/chelsea/9q0arba2kbnywth8bkxlhgmdr" target="_blank" style="color: rgb(0, 169, 206);">Chelsea</a>&nbsp;loanee was the game’s best player, almost unbeatable on the ground or in the air, capable in all the ways that he has not always been.</p><p>It is remarkable to think that, having been considered a third wheel leading up to the Afcon, he has now played every minute of both matches. With Balogun back fully fit, it was instead William Troost-Ekong who made way; the first time the&nbsp;<a href="https://www.goal.com/en/team/udinese/dxq76zcvnokq07cszdx0i6kve" target="_blank" style="color: rgb(0, 169, 206);">Udinese</a>&nbsp;man has missed a competitive game for Nigeria (unrelated to injury) since March 2016.</p><p>It was a decision that lent itself to the most assured defensive performance in recent times, and perhaps for the first time offered a full glimpse of what Gernot Rohr’s vision is: efficiency.</p><iframe class="ql-video" frameborder="0" allowfullscreen="true" src="https://player.performgroup.com/eplayer/eplayer.html#1bf2717752d22173e833c11d28.1ridsjotzemy41hieicm5u3c8c$s=1&amp;location=https%253A%252F%252Fwww.goal.com%252Fen%252Fnews%252Fomeruo-makes-unlikely-comeback-to-underpin-super-eagles%252Fdoxfvq0isrp1mfy6l0zv2dof&amp;visibility=hidden&amp;secure=true&amp;embedStyle=s" height="342"></iframe><p><br></p><p><span style="color: rgb(162, 170, 173);">Article continues below</span></p><p>That too may be cliche when talking about a German, and perhaps efficiency may not enough to go all the way.</p><p>However, it certainly has proven enough so far, and with Rohr it really is all about taking it one game at a time.</p><p>Now, there’s another cliche for you...</p>	2019-06-27 06:58:20.600775	2019-06-27 06:58:20.606763	3 min	super-eagles-through-to-the-round-of-16-20	8	2
18	1_3ZLHzQ0cSJxwa3gyviq53A.png	Fast JSON API serialization with Ruby on Rails	<p>We are pleased to announce the open source release of the&nbsp;<a href="https://github.com/Netflix/fast_jsonapi" target="_blank" style="color: inherit;">Fast JSON API</a>&nbsp;gem geared towards Ruby on Rails applications.</p><p>Introduction</p><p>Fast JSONAPI is aimed at providing all the major functionality that Active Model Serializer (AMS) provides, along with an emphasis on speed and performance by meeting a benchmark requirement of being 25 times faster than AMS. The gem also enforces<a href="https://github.com/Netflix/fast_jsonapi/blob/master/spec/lib/object_serializer_performance_spec.rb" target="_blank" style="color: inherit;">&nbsp;performance testing</a>&nbsp;as a discipline.</p><p>AMS is a great gem and<a href="https://github.com/Netflix/fast_jsonapi" target="_blank" style="color: inherit;">&nbsp;fast_jsonapi</a>&nbsp;was inspired by it when it comes to declaration syntax and features. AMS begins to slow down, however, when a model has one or more relationships. Compound documents, AKA sideloading, on those models makes AMS slow down further. Throw in a need for infinite scroll on the UI, and AMS’s slowness starts becoming visible to users.</p><p>Why optimize serialization?</p><p><span style="background-color: transparent;">JSON API serialization is often one of the slowest parts of many well implemented Rails APIs.</span>&nbsp;Why not provide all the major functionality that AMS provides with greater speed?</p><p>Features:</p><ul><li>Declaration syntax similar to Active Model Serializer</li><li>Support for belongs_to, has_many and has_one</li><li>Support for compound documents (included)</li><li>Optimized serialization of compound documents</li><li>Caching</li><li>Instrumentation with Skylight integration (optional)</li></ul><p>How do you write a serializer using Fast JSONAPI?</p><p>We like the familiar way Active Model Serializers lets us declare our serializers. Declaration syntax of fast_jsonapi is similar to AMS.</p><pre spellcheck="false">class MovieSerializer\r\n include FastJsonapi::ObjectSerializer\r\n attributes :name, :year\r\n has_many :actors\r\n belongs_to :owner, record_type: :user\r\n belongs_to :movie_type\r\nend\r\n</pre><p>How fast is it compared to Active Model Serializers?</p><p>Performance tests indicate a 25–40x speed gain over AMS, essentially making serialization time negligible on even fairly complex models. Performance gain is significant when the number of serialized records increases.</p><p>Difference in performance</p><p><img src="https://cdn-images-1.medium.com/max/1440/1*hqNFZ8-oqseea0kidZWyhg.png"></p><p>Don’t believe us? You can run the benchmark tests for yourself. Refer to<a href="https://github.com/Netflix/fast_jsonapi/blob/master/README.md" target="_blank" style="color: inherit;">readme</a>.</p><p>Dependency</p><p>JSON API is the anti-bikeshedding tool.</p><p>Future Work</p><p>We plan to add more features to the gem. We welcome suggestions, improvements, corrections and additional tests.</p>	2019-06-23 03:38:12.061904	2019-06-23 03:39:23.561138	2 min	fast-json-api-serialization-with-ruby-on-rails-18	3	9
15	1_CabB6rzDj5NA4s3CUYLKCA.gif	Add a background video to your landing page in Rails 5	<p>Creating a page with a dynamic background video is something I run into pretty often. It seems to be&nbsp;very on-trend for 2019 and is a great way to capture a visitor’s attention, because the first impression is most often formed ‘before the fold’ — before the visitor scrolls down past the first screen of a site.</p><p>Adding a video in the background is tricky for two reasons. The&nbsp;first reason&nbsp;is that the css&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">background</code>&nbsp;property cannot accept video formats. The&nbsp;second reason&nbsp;is because the HTML&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">&lt;video&gt;</code>&nbsp;tag cannot be used to access the rails asset pipeline.</p><h4>So, how to make it work? Here’s a simple tutorial to create a dynamic background in&nbsp;minutes:</h4><p><br></p><p>Like a background image, but with more&nbsp;flair.</p><h3>Step 1. Create your Rails application</h3><p>For this demo, I’ll making a basic application without a database. I’ve added the&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">postgresql</code>&nbsp;flag here if you’re creating an actual app with data, but for the sake of the video banner, it’s completely optional.</p><p><br></p><pre spellcheck="false">rails new video-demo --database=postgresql \r\nrails db:create #necessary because of PostgreSQL\r\n</pre><p>The next step is to create a static controller to handle the basic pages in our app. I’m creating a controller named&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">page</code>&nbsp;with one action called&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">home</code>&nbsp;.</p><pre spellcheck="false">rails g controller pages home \r\n</pre><p>Next, add a home route to connect the root page to the controller and the action.</p><pre spellcheck="false"># config/routes.rb\r\nroot to: "pages#home"\r\n</pre><p><br></p><p>Honestly, the hardest part of all this will be picking the&nbsp;video.</p><h3>Step 2. Add the video to your assets&nbsp;pipeline</h3><p>Sure, you could just the video to your images folder, but let’s do this properly.</p><p><br></p><p>The rails assets pipeline is a pretty powerful tool to take care of minification, time-stamping, cross-browser compatibility, etc. It also comes with a few Rails shortcuts that help generate the proper HTML with a rails tag. For example, the Rails&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">image_tag</code>&nbsp;becomes an&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">&lt;img&gt;</code>&nbsp;tag and automatically locates the image inside the&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">app/assets/images</code>&nbsp;folder.</p><p>So, how do we make Rails generate an HTML&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">&lt;video&gt;</code>&nbsp;tag?</p><p>We need some way to access a folder called&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">app/assets/videos</code>&nbsp;and generate a Rails&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">video_tag</code>&nbsp;to then generate an HTML&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">&lt;video&gt;</code>&nbsp;inside the view.</p><h4>First, add the folder to the application’s asset&nbsp;path</h4><pre spellcheck="false">#config/application.rb\r\n#make sure to add this below the class Application &lt; Rails::Application line\r\nconfig.assets.paths &lt;&lt; "#{Rails.root}/app/assets/videos"\r\n</pre><p><br></p><p>IMPORTANT: you must restart the server after this step.</p><h4>Second, make the video directory inside the&nbsp;terminal</h4><pre spellcheck="false">mkdir app/assets/videos\r\n</pre><p>In this tutorial, I’ll be adding a video right into the asset pipeline. There is also something that could be said for pulling a video from a 3rd party service like Cloudinary, or AWS S3, but I’ll save that for another article. If you’re using Active Storage with Rails 5, you can also get a video directly from it as well.</p><h3>Step 3. Find a video for your&nbsp;site</h3><p>There’s oodles of awesome sources for royalty-free videos, but my personal favorites are&nbsp;<a href="https://www.pexels.com/videos/" target="_blank" style="color: inherit;">Pexels</a>&nbsp;or&nbsp;<a href="http://www.coverr.co/" target="_blank" style="color: inherit;">Coverr</a>. For this example app, I’m be using this&nbsp;<a href="https://www.pexels.com/video/a-rocky-coast-1550080/" target="_blank" style="color: inherit;">beach panarama</a>&nbsp;vid, because I just got back from a trip toThailand and I’m already missing the warm weather and the tropical drinks. I’ve already downloaded the HD version and I am adding it to my&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">app/assets/videos</code>&nbsp;folder under the title&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">beach.mp4</code></p><p><br></p><h3>Step 4. Add the video tag to the home&nbsp;page</h3><p>The rails&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">video_tag</code>&nbsp;can take the same attributes as the HTML&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">&lt;video&gt;</code>&nbsp;tag, so you’ll be able to add things like looping, controls, autoplay, etc to make the video more dynamic. By default, the video I added above won’t autoplay and it’ll actually be impossible to make it place, since there are no controls.</p><p><br></p><pre spellcheck="false">&lt;%= video_tag "beach.mp4" %&gt;\r\n</pre><p>Let’s make the video_tag more user-friendly.</p><pre spellcheck="false">&lt;%= video_tag "beach.mp4", autoplay: :autoplay, loop: :loop, mute: :mute, class: "home_video" %&gt;\r\n</pre><p>Note the css class&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">.home_video</code>&nbsp;that I added in order to style the video using the stylesheet.</p><p>For more options, check out the&nbsp;<a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video" target="_blank" style="color: inherit;">Mozilla guide</a>&nbsp;to video tags.</p><h3>Step 5. Add&nbsp;styling</h3><p>The next two steps are optional. In the first, I’ll add a css class to make the video full-screen and fit it to the size of the page. In the second, I’ll add banner text and styling to make the example look like an actual web page.</p><p><br></p><p>First, add the css:</p><pre spellcheck="false">.home_video {\r\n width: 100vw;\r\n height: 100vh;\r\n position: absolute;\r\n display: flex;\r\n justify-content: center;\r\n object-fit: cover;\r\n top: 0;\r\n z-index: -2;\r\n}\r\n</pre><p>What if we wanted to add text over the video? Right now, the z-index of the video allows me to put text over it, but I can’t center it without adding more absolute divs, and in general&nbsp;<code style="background-color: rgba(0, 0, 0, 0.05);">position: absolute</code>&nbsp;is something I try to avoid if I can help it.</p><p>The easiest solution is to add a wrapper to both the video and text and set it to a flexbox</p><pre spellcheck="false">#app/views/pages/home.html.erb\r\n&lt;div class="home-video-wrapper"&gt;\r\n  &lt;%= video_tag "beach.mp4", autoplay: :autoplay, loop: :loop, mute: :mute, class: "home_video" %&gt;\r\n  &lt;h1 class="home"&gt; Welcome to Paradise&lt;/h1&gt;\r\n&lt;/div&gt;\r\n\r\n#app/assets/stylesheets/application.scss\r\n.home_video {\r\n width: 100vw;\r\n height: 100vh;\r\n position: absolute;\r\n object-fit: cover;\r\n top: 0;\r\n z-index: -2;\r\n}\r\n.home-video-wrapper {\r\nheight: 100vh;\r\ndisplay: flex;\r\n}\r\nh1.home {\r\n  color: white;\r\n}\r\n</pre><p>And we’re done!</p><p>You can find the demo app on&nbsp;<a href="https://background-video-demo.herokuapp.com/" target="_blank" style="color: inherit;">Heroku</a>&nbsp;or check out my repository below. I added some Bootstrap4 optimization to the app, but otherwise the code is the same.</p>	2019-06-23 02:43:15.449973	2019-06-23 02:44:56.61457	5 min	add-a-background-video-to-your-landing-page-in-rails-5-15	7	7
19	Screen_Shot_2019-06-17_at_6.10.44_AM.png	Active Record, Sidekiq, pools and threads	<p>At Appaloosa, we use Sidekiq a lot. In fact, we use it for all the background jobs we need. We also use a database (yes, this sounds crazy, I know.) with Active Record as ORM. Sometimes, Sidekiq jobs need to do stuff in our database, this looks like a normal situation, until…</p><p><br></p><h2>The recurring error…</h2><p>Until, this error pops many times:</p><blockquote>could not obtain a connection from the pool within 5.000 seconds (waited 5.002 seconds); all pooled connections were in use (ActiveRecord::ConnectionTimeoutError)</blockquote><p>And it pops many times, every day, at the same hour. Something like late at night, so yes, let’s try to understand and fix it.</p><h2>But how can this happen?</h2><p>Ok so, after checking all our monitoring tools we figured out that the error pops inside a Sidekiq job. And then, with more than 20 tabs opened on the browser (obviously, many were the same, opened from different sources, at different time), we found the theory and theoretically, the solution.</p><h3>Theory</h3><p>First of all, we have Active Record on one side with its proper configuration file. In this&nbsp;<code style="color: var(--theme-code-color, #333842);">config/database.yml</code>&nbsp;file, you can find something like:</p><p><span style="color: rgb(34, 134, 58);">development</span>: <span style="color: rgb(34, 134, 58);">adapter</span>: <span style="color: rgb(3, 47, 98);">postgresql</span> <span style="color: rgb(34, 134, 58);">database</span>: <span style="color: rgb(3, 47, 98);">my_super_database_development</span> <span style="color: rgb(34, 134, 58);">pool</span>: <span style="color: rgb(0, 92, 197);">3</span></p><p><a href="https://gist.github.com/ammelanie/5381da89ac5d35cd4cd917627087d7b2/raw/3e33c382d0b7d944774550c628ba306092c87d5c/database.yml" target="_blank" style="color: rgb(102, 102, 102);">view raw</a></p><p><a href="https://gist.github.com/ammelanie/5381da89ac5d35cd4cd917627087d7b2#file-database-yml" target="_blank" style="color: rgb(102, 102, 102);">database.yml</a>&nbsp;hosted with ❤ by&nbsp;<a href="https://github.com/" target="_blank" style="color: rgb(102, 102, 102);">GitHub</a></p><p>Remember the error?&nbsp;<code style="color: var(--theme-code-color, #333842);">could not obtain a connection from the pool</code>. It must have something to do with that&nbsp;<code style="color: var(--theme-code-color, #333842);">pool</code>&nbsp;configuration!</p><p>Ok let’s check it.&nbsp;<a href="https://guides.rubyonrails.org/v5.1/configuring.html#database-pooling" target="_blank" style="color: var(--theme-anchor-color, #557de8);">The official documentation</a>&nbsp;tells us that:</p><blockquote>Active Record database connections are managed by ActiveRecord::ConnectionAdapters::ConnectionPool which ensures that a connection pool synchronizes the amount of thread access to a limited number of database connections.</blockquote><p>and</p><blockquote>If you try to use more connections than are available, Active Record will block you and wait for a connection from the pool. If it cannot get a connection, a timeout error similar to that given below will be thrown.</blockquote><p>Here it is! This is what is happening:</p><p><a href="https://res.cloudinary.com/practicaldev/image/fetch/s--sVzi8LDP--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://cdn-images-1.medium.com/max/2908/1%2AkV6GVfQJEO9oTNSrvb39ig.gif" target="_blank" style="color: var(--theme-anchor-color, #557de8);"><img src="https://res.cloudinary.com/practicaldev/image/fetch/s--sVzi8LDP--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://cdn-images-1.medium.com/max/2908/1%2AkV6GVfQJEO9oTNSrvb39ig.gif" alt="That’s what must happen here!"></a><em>That’s what must happen here!</em></p><p>Ok, then, what about the other side? How is Sidekiq managing its threads to prevent this error?&nbsp;<a href="https://github.com/mperham/sidekiq/wiki/Advanced-Options#concurrency" target="_blank" style="color: var(--theme-anchor-color, #557de8);">The official wiki</a>&nbsp;is pretty straightforward:</p><blockquote>You can tune the amount of concurrency in your sidekiq process. By default, one sidekiq process creates&nbsp;<strong>10 threads</strong>.</blockquote><p>So, it creates as many threads as we mentioned on our&nbsp;<code style="color: var(--theme-code-color, #333842);">config/sidekiq.yml</code></p><p><a href="https://res.cloudinary.com/practicaldev/image/fetch/s--yoDeJp5m--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://cdn-images-1.medium.com/max/2908/1%2ArHb8IFG_bK7fLe7aOtSaIw.gif" target="_blank" style="color: var(--theme-anchor-color, #557de8);"><img src="https://res.cloudinary.com/practicaldev/image/fetch/s--yoDeJp5m--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://cdn-images-1.medium.com/max/2908/1%2ArHb8IFG_bK7fLe7aOtSaIw.gif" alt="concurrency must be the key!"></a><em>concurrency must be the key!</em></p><p>There is also a little note on the wiki:</p><blockquote>Note that ActiveRecord has a connection pool which needs to be properly configured in config/database.yml to work well with heavy concurrency. Set the pool setting to something close or equal to the number of threads</blockquote><p>THAT’S IT! If we have Sidekiq concurrency value equal to Active Record pool value we can’t have more threads than the accepted by Active Record, and no more errors. Voilà! Let’s check those values on our project, something should not be right.</p><p><span style="color: rgb(106, 115, 125);"># config/database.yml</span><span style="color: rgb(34, 134, 58);">staging</span>: <span style="color: rgb(34, 134, 58);">pool</span>: <span style="color: rgb(0, 92, 197);">3</span></p><p><a href="https://gist.github.com/ammelanie/469a477b6c494ef80257cf4bd4f194ed/raw/d7b66640331183f0a5d18158a8ac763f2ab9c086/database.yml" target="_blank" style="color: rgb(102, 102, 102);">view raw</a></p><p><a href="https://gist.github.com/ammelanie/469a477b6c494ef80257cf4bd4f194ed#file-database-yml" target="_blank" style="color: rgb(102, 102, 102);">database.yml</a>&nbsp;hosted with ❤ by&nbsp;<a href="https://github.com/" target="_blank" style="color: rgb(102, 102, 102);">GitHub</a></p><p>and</p><p><span style="color: rgb(106, 115, 125);"># config/sidekiq.yml</span><span style="color: rgb(34, 134, 58);">staging</span>: <span style="color: rgb(34, 134, 58);">:concurrency</span>: <span style="color: rgb(0, 92, 197);">3</span></p><p><a href="https://gist.github.com/ammelanie/c6d2cb08cd14f29cb42717c101f8feb4/raw/f0c091833b016341c378fdb4d2fe299b24c9039e/sidekiq.yml" target="_blank" style="color: rgb(102, 102, 102);">view raw</a></p><p><a href="https://gist.github.com/ammelanie/c6d2cb08cd14f29cb42717c101f8feb4#file-sidekiq-yml" target="_blank" style="color: rgb(102, 102, 102);">sidekiq.yml</a>&nbsp;hosted with ❤ by&nbsp;<a href="https://github.com/" target="_blank" style="color: rgb(102, 102, 102);">GitHub</a></p><p>??</p><h3>So… is everything ok?</h3><p>Ok, now things are really strange. On our configurations files we already have 3 for concurrency and 3 for pool fields, then, according to documentations, everything should work and we should not have any issues… But we have one! Then, I don’t know how but somewhere, at a time, 3 looks not to be equal to 3.</p><p>Let’s double check everything, somewhere one of those value has to be overridden.</p><p>Of course, the answer was NOPE.</p><h3>Let’s investigate 🕵🏻‍♀️</h3><p>As the error occurred each day at the same hour, we looked at the piece of code running at that moment and checked the logs.</p><p>We analyzed 40 lines that occured in less than 10 seconds. The result is a beautiful file named&nbsp;<code style="color: var(--theme-code-color, #333842);">sidekiq logs sherlock</code>&nbsp;with many background colors and others for the text. And we found something interesting…</p><h3>Can we reproduce it?</h3><p>Of course, we can try. Let’s create a tiny Rails app with a database and Sidekiq. Let’s have two configuration files with the same configuration, as we have seen before:</p><p><span style="color: rgb(106, 115, 125);"># config/sidekiq.yml</span><span style="color: rgb(34, 134, 58);">development</span>: <span style="color: rgb(34, 134, 58);">:concurrency</span>: <span style="color: rgb(0, 92, 197);">3</span></p><p><br></p><p><span style="color: rgb(106, 115, 125);"># config/database.yml</span><span style="color: rgb(34, 134, 58);">development</span>: <span style="color: rgb(34, 134, 58);">pool</span>: <span style="color: rgb(0, 92, 197);">3</span></p><p><a href="https://gist.github.com/ammelanie/a83aa721e057cd102a2bf222c9d3a5bb/raw/af408a1861bf828c4a51041840786dc3a3460aa6/config.yml" target="_blank" style="color: rgb(102, 102, 102);">view raw</a></p><p><a href="https://gist.github.com/ammelanie/a83aa721e057cd102a2bf222c9d3a5bb#file-config-yml" target="_blank" style="color: rgb(102, 102, 102);">config.yml</a>&nbsp;hosted with ❤ by&nbsp;<a href="https://github.com/" target="_blank" style="color: rgb(102, 102, 102);">GitHub</a></p><p>Now we can create a worker:</p><p><span style="color: rgb(215, 58, 73);">class</span> <span style="color: rgb(111, 66, 193);">MyWorker</span> <span style="color: rgb(215, 58, 73);">include</span> <span style="color: rgb(0, 92, 197);">Sidekiq</span>::<span style="color: rgb(0, 92, 197);">Worker</span> <span style="color: rgb(215, 58, 73);">def</span> <span style="color: rgb(111, 66, 193);">perform</span> <span style="color: rgb(0, 92, 197);">puts</span> <span style="color: rgb(3, 47, 98);">'Inside worker'</span> <span style="color: rgb(0, 92, 197);">MyService</span>.<span style="color: rgb(215, 58, 73);">new</span>.call <span style="color: rgb(215, 58, 73);">endend</span></p><p><a href="https://gist.github.com/ammelanie/183be67fc1eafc6ddb8336fc45173c14/raw/f7844f5e870f9fc900970aa5d2bc7f71b0510121/my_worker.rb" target="_blank" style="color: rgb(102, 102, 102);">view raw</a></p><p><a href="https://gist.github.com/ammelanie/183be67fc1eafc6ddb8336fc45173c14#file-my_worker-rb" target="_blank" style="color: rgb(102, 102, 102);">my_worker.rb</a>&nbsp;hosted with ❤ by&nbsp;<a href="https://github.com/" target="_blank" style="color: rgb(102, 102, 102);">GitHub</a></p><p>This is a simple worker, doing nothing but calling a service which is going to do some stuff. For this service, we tried to reproduce the code we have, but this code is calling some other gem. To avoid complexity, we try to simplify it but keeping the main behavior.</p><p><span style="color: rgb(215, 58, 73);">class</span> <span style="color: rgb(111, 66, 193);">MyService</span> <span style="color: rgb(215, 58, 73);">def</span> <span style="color: rgb(111, 66, 193);">call</span> threads <span style="color: rgb(215, 58, 73);">=</span> [] <span style="color: rgb(0, 92, 197);">ActiveRecord</span>::<span style="color: rgb(0, 92, 197);">Base</span>.connection.execute(<span style="color: rgb(3, 47, 98);">"select pg_sleep(4);"</span>) <span style="color: rgb(106, 115, 125);"># Simulate some query</span> <span style="color: rgb(0, 92, 197);">0</span>.upto <span style="color: rgb(0, 92, 197);">10</span> <span style="color: rgb(215, 58, 73);">do</span> |index| <span style="color: rgb(0, 92, 197);">puts</span> <span style="color: rgb(3, 47, 98);">"calling Service #{index}"</span> threads <span style="color: rgb(215, 58, 73);">&lt;&lt;</span> async_call <span style="color: rgb(215, 58, 73);">do</span> <span style="color: rgb(0, 92, 197);">ActiveRecord</span>::<span style="color: rgb(0, 92, 197);">Base</span>.connection.execute(<span style="color: rgb(3, 47, 98);">"select pg_sleep(20);"</span>) <span style="color: rgb(106, 115, 125);"># &lt;=== simulate a long query</span> <span style="color: rgb(215, 58, 73);">end</span> <span style="color: rgb(215, 58, 73);">end</span> threads.join <span style="color: rgb(215, 58, 73);">end</span></p><p><span style="color: rgb(215, 58, 73);">def</span> <span style="color: rgb(111, 66, 193);">async_call</span> <span style="color: rgb(0, 92, 197);">Thread</span>.<span style="color: rgb(215, 58, 73);">new</span> <span style="color: rgb(215, 58, 73);">do</span> <span style="color: rgb(0, 92, 197);">puts</span> <span style="color: rgb(3, 47, 98);">'do some async stuff here'</span> <span style="color: rgb(215, 58, 73);">yield</span> <span style="color: rgb(215, 58, 73);">end</span> <span style="color: rgb(215, 58, 73);">endend</span></p><p><a href="https://gist.github.com/ammelanie/e8a84b17081b0d447fc72e816566c274/raw/8d23444990716ba81cbc48ad970113d3e20350c7/my_service.rb" target="_blank" style="color: rgb(102, 102, 102);">view raw</a></p><p><a href="https://gist.github.com/ammelanie/e8a84b17081b0d447fc72e816566c274#file-my_service-rb" target="_blank" style="color: rgb(102, 102, 102);">my_service.rb</a>&nbsp;hosted with ❤ by&nbsp;<a href="https://github.com/" target="_blank" style="color: rgb(102, 102, 102);">GitHub</a></p><p>Try to run your worker and look at the result…</p><blockquote>ruby-2.5.3/gems/activerecord-5.2.1.1/lib/active_record/connection_adapters/abstract/connection_pool.rb:199:in `block in wait_poll’: could not obtain a connection from the pool within 5.000 seconds (waited 5.010 seconds); all pooled connections were in use (ActiveRecord::ConnectionTimeoutError)</blockquote><p>We are not sure that is exactly mimicking our behavior as the code uses transitive dependencies that are creating threads. But it looks like this and we ran into the same issue.</p><p>And it makes sense. Remember, we said that for each process Active Record assigns&nbsp;<code style="color: var(--theme-code-color, #333842);">x</code>&nbsp;connections depending on the&nbsp;<code style="color: var(--theme-code-color, #333842);">pool</code>&nbsp;value. Each connection is made by one thread. If our Sidekiq&nbsp;<code style="color: var(--theme-code-color, #333842);">concurrency</code>&nbsp;value is equal to the&nbsp;<code style="color: var(--theme-code-color, #333842);">pool</code>value, we should not have any problem, unless, something is creating a new thread and calling the database. That’s the case on our example above with the&nbsp;<code style="color: var(--theme-code-color, #333842);">MyService</code>&nbsp;class!</p><h2>The why!</h2><p><a href="https://res.cloudinary.com/practicaldev/image/fetch/s--CMHJ5Nhj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://cdn-images-1.medium.com/max/3516/1%2Ae1Okff4MfeTwIWQBGk4nlQ.gif" target="_blank" style="color: var(--theme-anchor-color, #557de8);"><img src="https://res.cloudinary.com/practicaldev/image/fetch/s--CMHJ5Nhj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://cdn-images-1.medium.com/max/3516/1%2Ae1Okff4MfeTwIWQBGk4nlQ.gif"></a></p><p>In fact, it’s possible to do async job here but we need to be sure that we are not dealing with database, or at least, it’s not creating too much connections. In our case, we are inside a deep loop, which leads to too many database calls. 💥</p><p>If you don’t want to have some headaches, be careful on what you put inside your workers 🙂</p><p><br></p><p><a href="https://dev.to/appaloosastore/active-record-sidekiq-pools-and-threads-18d5" target="_blank">https://dev.to/appaloosastore/active-record-sidekiq-pools-and-threads-18d5</a></p><p><a href="https://res.cloudinary.com/practicaldev/image/fetch/s--r-wneBFP--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://cdn-images-1.medium.com/max/6000/0%2AtWDf4h0UaPtfbnQD" target="_blank" style="color: var(--theme-anchor-color, #557de8);"><img src="https://res.cloudinary.com/practicaldev/image/fetch/s--r-wneBFP--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://cdn-images-1.medium.com/max/6000/0%2AtWDf4h0UaPtfbnQD" alt="Photo by [Ayo Ogunseinde](https://unsplash.com/@armedshutter?utm_source=medium&amp;utm_medium=referral) on [Unsplash](https://unsplash.com?utm_source=medium&amp;utm_medium=referral)"></a><em>Photo by&nbsp;</em><a href="https://unsplash.com/@armedshutter?utm_source=medium&amp;utm_medium=referral" target="_blank" style="color: var(--theme-anchor-color, #557de8);"><em>Ayo Ogunseinde</em></a><em>&nbsp;on&nbsp;</em><a href="https://unsplash.com/?utm_source=medium&amp;utm_medium=referral" target="_blank" style="color: var(--theme-anchor-color, #557de8);"><em>Unsplash</em></a></p><p><br></p>	2019-06-27 06:35:29.270437	2019-06-27 06:37:37.010627	7 min	active-record,-sidekiq,-pools-and-threads-19	6	9
42	20dc-trump1-superJumbo.jpg	In ‘Send Her Back’ Fallout, Trump Amplifies Praise From Right-Wing Commentator	<p>BRIDGEWATER, N.J. — President Trump on Saturday extended the debate over a chant of “send her back!” at his campaign rally in North Carolina this week when he retweeted a right-wing British commentator who has drawn repeated condemnation over a long history of anti-Muslim remarks and for casting blame on a Jewish leader for provoking a synagogue shooting.</p><p>Sending fresh mixed signals about his view of the chant directed at a Democratic lawmaker, Representative Ilhan Omar of Minnesota, Mr. Trump&nbsp;<a href="https://twitter.com/realDonaldTrump/status/1152532958487748609" target="_blank" style="color: rgb(50, 104, 145);">shared video of the episode</a>&nbsp;posted by the commentator, Katie Hopkins, who has said “Islam disgusts me” and who last year appeared to link a rabbi’s pro-migrant work to the&nbsp;<a href="https://www.nytimes.com/2018/10/27/us/active-shooter-pittsburgh-synagogue-shooting.html?module=inline" target="_blank" style="color: rgb(50, 104, 145);">mass shooting at the Tree of Life synagogue</a>&nbsp;in Pittsburgh.</p><p>Ms. Hopkins was celebrating the moment in Greenville, N.C., on Wednesday, suggesting that the crowd’s chant could be a new slogan for Mr. Trump’s re-election campaign. “Send her back is the new lock her up,”&nbsp;<a href="https://twitter.com/KTHopkins/status/1151738558501330945" target="_blank" style="color: rgb(50, 104, 145);">she wrote</a>, referring to a refrain from the 2016 campaign directed at Trump’s Democratic rival, Hillary Clinton.</p><p>“Well done to #TeamTrump,” she added.</p><p>Mr. Trump, who has shifted his account of how he responded to the chant about Ms. Omar, posted Ms. Hopkins’s tweet on his own feed while adding commentary that placed some distance between himself and his supporters that night in Greenville.</p>	2019-07-21 04:35:28.80318	2019-07-21 04:36:10.838937	2 min	in-send-her-back-fallout-trump-amplifies-praise-from-right-wing-commentator-42	1	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Sports	2019-05-14 16:29:37.274582	2019-05-14 16:29:37.274582
2	Tech	2019-05-14 18:30:01.652392	2019-05-14 18:30:01.652392
3	Music	2019-05-14 18:36:58.040165	2019-05-14 18:36:58.040165
4	Movies	2019-05-14 18:37:19.148727	2019-05-14 18:37:19.148727
5	Education	2019-05-14 18:37:43.484625	2019-05-14 18:37:43.484625
6	Arts	2019-05-14 18:38:10.477195	2019-05-14 18:38:10.477195
7	Programming	2019-05-14 18:40:57.389203	2019-05-14 18:40:57.389203
8	Engineering	2019-05-15 06:24:59.954416	2019-05-15 06:24:59.954416
9	Fashion	2019-05-15 10:48:27.697361	2019-05-15 10:48:27.697361
10	Politics	2019-05-15 10:49:10.584594	2019-05-15 10:49:10.584594
11	Gaming	2019-05-19 10:51:25.017281	2019-05-19 10:51:25.017281
12	Autos	2019-05-19 14:36:06.162475	2019-05-19 14:36:06.162475
13	Inspirational	2019-05-28 02:38:40.729742	2019-05-28 02:38:40.729742
14	Religion	2019-05-28 02:42:24.707239	2019-05-28 02:42:24.707239
15	Life Style	2019-05-28 02:49:20.016396	2019-05-28 02:49:20.016396
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.followers (id, follower_id, followed_id) FROM stdin;
124	4	8
133	4	1
135	4	9
139	4	6
147	2	7
149	1	6
151	1	8
152	1	7
85	6	4
86	6	1
87	6	2
96	4	2
101	1	2
110	7	1
111	7	2
112	7	6
113	9	7
114	9	1
115	9	4
116	2	9
117	2	1
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.likes (id, user_id, article_id) FROM stdin;
1	1	3
3	2	3
5	1	2
6	2	1
7	4	6
8	4	7
11	4	9
13	6	1
14	6	3
15	6	10
16	4	2
17	1	1
18	4	1
28	1	10
29	1	9
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.schema_migrations (version) FROM stdin;
20190424161224
20190424163905
20190424165800
20190424170747
20190425102452
20190427205532
20190505075939
20190505080909
20190505081758
20190505085009
20190506164857
20190507152741
20190508102028
20190510213927
20190511180022
20190527073252
20190602174307
20190616043747
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: d54idb2u789rq
--

COPY public.users (id, username, email, password_digest, created_at, updated_at, bio, image_url, is_admin, full_name) FROM stdin;
6	50cent	50cent@gmail.com	$2a$10$calQskM8sJjnHKWyZDdA2eVRQ/3GvMMJOPj9xNTQ3ZqKtNaIs4/we	2019-06-16 14:20:39.162855	2019-06-17 22:10:45.779414	 Get the strapp!!	484925_v9_bb.jpg	f	Curtis Jackson
7	omenkish8	kevinomenkish@gmail.com	$2a$10$wu2f8sWdoW7zKLV5sr/IyOwft1QcsE6Yk1WNPmaLbNYhnja5mpoFS	2019-06-23 02:03:32.593261	2019-06-23 02:37:11.605311	 Free-thinker, thought-provoker, table-shaker and motivational speaker	Screen_Shot_2019-06-23_at_3.36.45_AM.png	f	Kevin Omede
8	paskillo	pascalofurunna@gmail.com	$2a$10$pQYjIIxg9DSNaeSrnmzMuuWRmJaROP2ZwfFMTW2DPQgV/0uWpZS0y	2019-06-23 02:57:23.811468	2019-06-23 02:59:55.700962	\N	Blaise_Pascal._Lithograph_after_G._Edelinck_after_F._Quesnel_Wellcome_V0004512-998x740.jpg	f	\N
9	solo4solo	soloezeobika@gmail.com	$2a$10$3YNwP8q7nEe/7FrM0bJNH.n2ANfUkbQExmIznfHWzh4g.zPgoypwC	2019-06-23 03:25:17.998463	2019-06-26 10:59:52.193155	I love yelling "Hellur", "Hellur" on calls  	18664405_1552903101386609_6882057538011868334_n.jpg	f	Solomon Ezeobika
10	chichi	chidinmakessie@gmail.com	$2a$10$LOErKYgE1H5ZgC42luGkbOfFpa.AjG3Nqrh2DtQvmyZmceeiYTvY.	2019-06-30 22:18:11.221117	2019-06-30 22:30:05.288171	I'm a hot tottie  	56951229_2217931561632892_1492706649545113600_n.jpg	f	Chidinma Ogbonna
4	nduks	ndukachikezie@gmail.com	$2a$10$NYxZep71qVBYtxGfBLdfE.1LzwRMIJNtTtVflqWwcuf7Xuk9xQCc.	2019-05-08 11:55:06.279432	2019-05-30 03:32:46.87191	Cool and easy going guy	EJnduka1.jpg	f	Nduka Chikezie
11	jonslow	jonslow@gmail.com	$2a$10$J5m781FZ6I47mP66n6r6aOW1AZafr1bF0pAwYrCH.dwm5Ybm2o/lq	2019-07-03 12:31:03.028777	2019-07-03 12:31:03.028777	\N	\N	f	\N
2	knowledge	knowledgeagare157@gmail.com	$2a$10$ziDr4gEIKp.0vvAUqISZVuRFWHckloQ7fqo7knI3VQ5phf0kfkNZe	2019-05-08 06:37:41.608427	2019-07-16 11:25:03.709142	I've got wisdom, knowledge and understanding  	DQh58mnXUAAB04v.jpg	f	Efe Agare
5	charlemagnethagod	cthagod20@gmail.com	$2a$10$MXJj0/c7wE/ZyzLworHYoe6Mtiil5auW6ZAFWw.EJLQFrCXxuzRaK	2019-06-16 13:05:30.855876	2019-06-16 13:05:30.855876	\N	\N	f	\N
1	ozone	d54idb2u789rq1@gmail.com	$2a$10$XjHM5Nbo9iakjfEUHpvPuOYz4/VRrMS8HiK/mDqi.Fxo.frRZS1wK	2019-05-07 16:12:09.205485	2019-07-16 11:26:18.09046	 Badder than the baddest  boy	48406340_1920168408081243_624160710632407040_o.jpg	t	Ezenwa Ogbonna
12	shalewa	shabalewa@gmail.com	$2a$10$UxvftD3YmzfYLRkQ05y38O0uqqwx771l5gxNFeOSnuKgbXMVpCP2S	2019-07-23 19:54:34.523478	2019-07-23 19:54:34.523478	\N	\N	f	\N
13	paschoo	paschalumunna@gmail.com	$2a$10$dtasAtduhDZLYDg7bv3/3uy9A9ADTKcMpLL1BO.KiIp2wdvuI77H2	2019-07-24 04:50:35.949974	2019-07-25 03:09:53.78252	\N	image/upload/v1564024196/ozones-blog/user/image_url/13.jpg	f	\N
\.


--
-- Name: article_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: d54idb2u789rq
--

SELECT pg_catalog.setval('public.article_categories_id_seq', 27, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: d54idb2u789rq
--

SELECT pg_catalog.setval('public.articles_id_seq', 42, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: d54idb2u789rq
--

SELECT pg_catalog.setval('public.categories_id_seq', 15, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: d54idb2u789rq
--

SELECT pg_catalog.setval('public.followers_id_seq', 152, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: d54idb2u789rq
--

SELECT pg_catalog.setval('public.likes_id_seq', 29, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: d54idb2u789rq
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: article_categories article_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_article_categories_on_article_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_article_categories_on_article_id ON public.article_categories USING btree (article_id);


--
-- Name: index_article_categories_on_category_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_article_categories_on_category_id ON public.article_categories USING btree (category_id);


--
-- Name: index_articles_on_user_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_articles_on_user_id ON public.articles USING btree (user_id);


--
-- Name: index_followers_on_followed_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_followers_on_followed_id ON public.followers USING btree (followed_id);


--
-- Name: index_followers_on_follower_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_followers_on_follower_id ON public.followers USING btree (follower_id);


--
-- Name: index_followers_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE UNIQUE INDEX index_followers_on_follower_id_and_followed_id ON public.followers USING btree (follower_id, followed_id);


--
-- Name: index_likes_on_article_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_likes_on_article_id ON public.likes USING btree (article_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: d54idb2u789rq
--

CREATE INDEX index_likes_on_user_id ON public.likes USING btree (user_id);


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: articles fk_rails_3d31dad1cc; Type: FK CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_rails_3d31dad1cc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: article_categories fk_rails_6f9552b855; Type: FK CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT fk_rails_6f9552b855 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: likes fk_rails_86adad7015; Type: FK CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_86adad7015 FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- Name: article_categories fk_rails_9681f08b87; Type: FK CONSTRAINT; Schema: public; Owner: d54idb2u789rq
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT fk_rails_9681f08b87 FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- PostgreSQL database dump complete
--

