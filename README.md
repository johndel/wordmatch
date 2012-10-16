Wordmatch
=========

### Description
It finds words with the letters that you enter.

<ul>
<li>solver.rb is for games like hangman, where you know some letters and you want to find the rest.</li>
<li>bookworm.rb is for games like scrabble or bookworm adventures (http://http://www.popcap.com/games/bookworm-adventures2/pc which is the actual reason I created all this), you
enter all the letters and it finds all the possible combination it can.</li>
</ul>

### Usage
1. Create a database with your credentials and put them in the solver.rb (your username and password)
2. Insert the words with `mysql -u your_username -pyour_password wordmatch < wordmatch.sql`
3. After it finishes, type `ruby solver.rb letters` or `ruby bookworm.rb letters` and it will play accordingly

### Future
It takes approximately 25-30 seconds to match the words so it isn't so efficient. I'd like to make it faster.

_I'd love to hear your comments about. Thank you!_
