class08
================
Dominika Kardasz
April 25th, 2019

\#K-means clustering

Let’s start with an example of runing **kmeans()**
function

``` r
# Generate some example data for clustering- rnorm generates random 30 points, here two groups 
tmp <- c(rnorm(30,-3), rnorm(30,3))
x <- cbind(x=tmp, y=rev(tmp))
plot(x)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

To do : -Use the kmeans() function setting k to 2 and nstart=20
-Inspect/print the results

``` r
km <- kmeans(x, centers=2, nstart=20)
km
```

    ## K-means clustering with 2 clusters of sizes 30, 30
    ## 
    ## Cluster means:
    ##           x         y
    ## 1  3.087082 -3.133269
    ## 2 -3.133269  3.087082
    ## 
    ## Clustering vector:
    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1
    ## [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    ## 
    ## Within cluster sum of squares by cluster:
    ## [1] 39.28152 39.28152
    ##  (between_SS / total_SS =  93.7 %)
    ## 
    ## Available components:
    ## 
    ## [1] "cluster"      "centers"      "totss"        "withinss"    
    ## [5] "tot.withinss" "betweenss"    "size"         "iter"        
    ## [9] "ifault"

> Q. How many points are in each cluster? A. 30 points in each

> Q. What ‘component’ of your result object details - cluster size?

``` r
km$size
```

    ## [1] 30 30

  - cluster
    assignment/membership?

<!-- end list -->

``` r
km$cluster
```

    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1
    ## [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

  - cluster center? “centers”

<!-- end list -->

``` r
km$centers
```

    ##           x         y
    ## 1  3.087082 -3.133269
    ## 2 -3.133269  3.087082

> Plot x colored by the kmeans cluster assignment and add cluster
> centers as blue points

``` r
#accesing 1 cluster to colour it 
plot(x, col=km$cluster)
# adding the centres of the clusters 
points(km$centers, pch=18, col=("blue"), cex=3)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

\#\#Hierarchical Clustering example

We must give the **hclust()** function a distance matrix not the raw
data as input

``` r
#Distance matrix calculation 
d<- dist(x)

#clustering
hc<- hclust(d)

#plot results as a dendrogram
plot(hc)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
plot(hc)
abline(h=6, col="red")
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

``` r
cutree(hc, h=6)
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2
    ## [36] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

``` r
cutree(hc, k=2)
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2
    ## [36] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

``` r
cutree(hc, k=3)
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2
    ## [36] 2 2 2 2 2 2 2 2 2 3 2 2 3 3 2 3 3 3 3 3 3 3 2 2 2

Another example, but more real life like with overlapping clusters of
data

``` r
# Step 1. Generate some example data for clustering
x <- rbind(
matrix(rnorm(100, mean=0, sd = 0.3), ncol = 2), # c1
matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2), # c2
matrix(c(rnorm(50, mean = 1, sd = 0.3), # c3
rnorm(50, mean = 0, sd = 0.3)), ncol = 2))
colnames(x) <- c("x", "y")

# Step 2. Plot the data without clustering
plot(x)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

``` r
# Step 3. Generate colors for known clusters
# (just so we can compare to hclust results)
col <- as.factor( rep(c("c1","c2","c3"), each=50) )
plot(x, col=col)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-12-2.png)<!-- -->

> Q. Use the dist(), hclust(), plot() and cutree() functions to return 2
> and 3 clusters

> Q. How does this compare to your known ‘col’ groups?

``` r
#distance matrix calculation and clustering
hc <- hclust( dist(x))
#plot results as a dendrogram
plot(hc)
abline(h=2, col="red")
abline(h=2.8, col="blue")
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

``` r
# give results for 2 and 3 clusters
gp2 <- cutree(hc, k=2)
gp3 <- cutree(hc, k=3)
```

``` r
gp2
```

    ##   [1] 1 2 2 2 1 2 1 1 1 2 1 1 1 1 1 2 2 1 2 1 2 2 1 2 1 1 2 1 1 1 1 1 1 2 2
    ##  [36] 1 1 1 1 1 1 1 1 1 2 1 2 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    ##  [71] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    ## [106] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    ## [141] 2 2 2 2 2 2 2 2 2 2

``` r
gp3
```

    ##   [1] 1 2 2 2 1 2 1 1 1 2 1 1 1 1 1 2 2 1 2 1 2 3 1 3 1 1 2 1 1 1 1 1 1 2 2
    ##  [36] 1 1 1 1 1 1 1 1 1 2 1 2 1 2 2 3 3 3 3 3 3 2 3 3 3 2 3 3 3 3 3 3 2 3 3
    ##  [71] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 3 3 3 3 3 2 3 3 3 2 2 2 2 2
    ## [106] 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 2
    ## [141] 2 2 2 2 2 2 2 2 3 2

``` r
plot(x, col=gp2)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

``` r
plot(x, col=gp3)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

``` r
table(gp2)
```

    ## gp2
    ##   1   2 
    ##  32 118

``` r
table(gp3)
```

    ## gp3
    ##  1  2  3 
    ## 32 68 50

``` r
#comparing in a way anwsers from the two different gp's 
table(gp2, gp3)
```

    ##    gp3
    ## gp2  1  2  3
    ##   1 32  0  0
    ##   2  0 68 50

\#PCA: Principal Component Analysis

We will use **prcomp()** function for PCA

``` r
## You can also download this file from the class website!
mydata <- read.csv("https://tinyurl.com/expression-CSV",
                   row.names=1)
#shows just first few row of data not all 
head(mydata, 10)
```

    ##         wt1 wt2  wt3  wt4 wt5 ko1 ko2 ko3 ko4 ko5
    ## gene1   439 458  408  429 420  90  88  86  90  93
    ## gene2   219 200  204  210 187 427 423 434 433 426
    ## gene3  1006 989 1030 1017 973 252 237 238 226 210
    ## gene4   783 792  829  856 760 849 856 835 885 894
    ## gene5   181 249  204  244 225 277 305 272 270 279
    ## gene6   460 502  491  491 493 612 594 577 618 638
    ## gene7    27  30   37   29  34 304 304 285 311 285
    ## gene8   175 182  184  166 180 255 291 305 271 269
    ## gene9   658 669  653  633 657 628 627 603 635 620
    ## gene10  121 116  134  117 133 931 941 990 982 934

``` r
nrow(mydata)
```

    ## [1] 100

``` r
ncol(mydata)
```

    ## [1] 10

``` r
colnames(mydata)
```

    ##  [1] "wt1" "wt2" "wt3" "wt4" "wt5" "ko1" "ko2" "ko3" "ko4" "ko5"

``` r
##Transposong the matrix , because prcomp reads it differnetly and running pca
pca <- prcomp(t(mydata), scale. = T)
```

``` r
## A basic PC1 vs PC2 2-D plot
plot(pca$x[,1], pca$x[,2], xlab = "PC1", ylab = "PC2")
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->
Calculate the percent variance captures in each PC

``` r
## Precent variance is often more informative to look at
pca.var <- pca$sdev^2
pca.var.per <- round(pca.var/sum(pca.var)*100, 1)

head(pca.var.per)
```

    ## [1] 92.6  2.3  1.1  1.1  0.8  0.7

``` r
barplot(pca.var.per, main="Scree Plot",
xlab="Principal Component", ylab="Percent Variation")
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

``` r
## A vector of colors for wt and ko samples
colvec <- colnames(mydata)
colvec[grep("wt", colvec)] <- "red"
colvec[grep("ko", colvec)] <- "blue"
plot(pca$x[,1], pca$x[,2], col=colvec, pch=16,
xlab=paste0("PC1 (", pca.var.per[1], "%)"),
ylab=paste0("PC2 (", pca.var.per[2], "%)"))
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

PCA UK food exhercise \>Load the data

``` r
x <- read.csv("UK_foods.csv", row.names = 1)
head(x)
```

    ##                England Wales Scotland N.Ireland
    ## Cheese             105   103      103        66
    ## Carcass_meat       245   227      242       267
    ## Other_meat         685   803      750       586
    ## Fish               147   160      122        93
    ## Fats_and_oils      193   235      184       209
    ## Sugars             156   175      147       139

> Q1. How many rows and columns are in your new data frame named x? What
> R functions could you use to answer this questions?

``` r
dim(x)
```

    ## [1] 17  4

``` r
##visualise the data as barplots
barplot(as.matrix(x), beside=T, col=rainbow(nrow(x)))
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

> Q3: Changing what optional argument in the above barplot() function
> results in the following plot? A: **beside()** change to
FALSE

``` r
barplot(as.matrix(x), beside=F, col=rainbow(nrow(x)))
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

> Q5: Generating all pairwise plots may help somewhat. Can you make
> sense of the following code and resulting figure? What does it mean if
> a given point lies on the diagonal for a given plot? A: If sth is on a
> diagonal that means that the food is
same

``` r
pairs(x, col=rainbow(10), pch=16)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-35-1.png)<!-- -->

``` r
# Use the prcomp() PCA function 
pca <- prcomp( t(x) )
summary(pca)
```

    ## Importance of components:
    ##                             PC1      PC2      PC3       PC4
    ## Standard deviation     324.1502 212.7478 73.87622 4.189e-14
    ## Proportion of Variance   0.6744   0.2905  0.03503 0.000e+00
    ## Cumulative Proportion    0.6744   0.9650  1.00000 1.000e+00

``` r
#cumulative proportion means that letds say 96% of the data is captured in 2 dimensions 
```

``` r
mycols<- c("orange", "red", "blue", "darkgreen")

# Plot PC1 vs PC2
plot(pca$x[,1], pca$x[,2], xlab="PC1", ylab="PC2", xlim=c(-270,500))

#**colnames** names the points with country names
text(pca$x[,1], pca$x[,2], colnames(x), col=mycols)
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

\#\#Digging deeper (variable loadings )

``` r
## Lets focus on PC1 as it accounts for > 90% of variance 
# plot tells which foods are more eaten in countries against another 
par(mar=c(10, 3, 0.35, 0))
barplot( pca$rotation[,1], las=2 )
```

![](Class8Machinelearning_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->
