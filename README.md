

<body class="stackedit">
  <div class="stackedit__html"><h1 id="tutorial-how-to-make-multivariate-graphs-in-r-xyz">Tutorial how to make multivariate graphs in R (x,y,z)</h1>
<p><img src="https://i.imgur.com/UGLMSsB.png" alt="hi im a beautiful graphic"><br>
by. William Giani Duani Martins.<br>
Federal University of Minas Gerais</p>
<p>If you don’t want to learn the step-by-step and just want the code, scroll to the end.</p>
<h2 id="how-to-install-rgl-package-in-linux">How to install rgl package in linux</h2>
<p>We gonna use rgl package to plot the graph.<br>
If you use linux like i do, you probably gonna have some troubles to install this package, so after hours of hard search i resumed all the commands you gonna have to use.</p>
<p>First, write this in linux terminal:</p>
<pre><code>sudo apt-get install libglu1-mesa-dev
</code></pre>
<p>Second, paste this in R console:</p>
<pre><code> install.packages("rgl", repos="http://R-Forge.R-project.org")
</code></pre>
<p>This commands probably will allow to correctly install the package, and fix the error “installation of package ‘rgl’ had non-zero exit status.”</p>
<p><strong>If you’re in windows, just install it normally.</strong></p>
<h2 id="adjusting-the-domain">Adjusting the domain</h2>
<p>First, we gonna create the domain of x and y.</p>
<pre><code>x &lt;- c(seq(-5,5,by=0.01))
y &lt;- c(seq(-5,5,by=0.01))
</code></pre>
<p>In this case, my function is defined from -5, to 5.</p>
<h2 id="adjusting-the-function">Adjusting the function</h2>
<p>Now we gonna create the function which we want to graph:<br>
<img src="https://i.imgur.com/7oC8uJD.gif" alt="enter image description here"></p>
<pre><code>f &lt;- function(x, y) { r &lt;- (x**2) + (4*y)**2}
</code></pre>
<h2 id="calculating-fxy">Calculating f(x,y)</h2>
<p>The great secret here is how to get the f(x,y), we can use the function outer to make it.</p>
<pre><code>z &lt;- outer(x, y, f)
</code></pre>
<h2 id="converting-to-data.frame-">Converting to data.frame ()</h2>
<p>Now we gonna convert everything to a beautiful data.frame</p>
<pre><code>meow &lt;- data.frame(x1 = x, x2 = y, y = as.vector(z))
</code></pre>
<h2 id="plotting-the-multivariate-graph-in-r">Plotting the multivariate graph in R</h2>
<pre><code>wireframe(y ~ x1+x2, data = meow,  drape = TRUE, col.regions=heat.colors(150),
colorkey = TRUE,  screen = list(z = -50, x = -60), 
          aspect = c(61/87, 0.4),
          xlab="x", ylab="y", zlab="f(x,y)")
</code></pre>
<p>I recommend you play a little bit with this args, so you gonna realize how it works</p>

<table>
<thead>
<tr>
<th>### Arguments</th>
<th>Resume</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>screen = list(z = -50, x = -60)</code></td>
<td>Will rotate your graph</td>
</tr>
<tr>
<td><code>aspect = c(61/87, 0.4)</code></td>
<td>Your graph will be more deep</td>
</tr>
</tbody>
</table><h2 id="final-code-for-people-who-doesnt-want-to-read-everything">Final code for people who doesn’t want to read everything</h2>
<pre><code>x &lt;- seq(-10, 10, length= 30)
y &lt;- x
f &lt;- function(x, y) { r &lt;- (x**2) + (4*y)**2}
z &lt;- outer(x, y, f)
meow &lt;- data.frame(x1 = x, x2 = y, y = as.vector(z))
wireframe(y ~ x1+x2, data = meow, drape = TRUE, col.regions =heat.colors(150),
          colorkey = TRUE,  screen = list(z = -50, x = -60), aspect = c(61/87, 0.4),
          xlab="x", ylab="y",zlab="f(x,y)")
</code></pre>
</div>
</body>

</html>
