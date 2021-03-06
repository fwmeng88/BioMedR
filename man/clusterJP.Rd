% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1003-clusterJarvis-Patrick.R
\name{clusterJP}
\alias{clusterJP}
\title{Jarvis-Patrick Clustering}
\usage{
clusterJP(nnm, k, mode = "a1a2b", linkage = "single")
}
\arguments{
\item{nnm}{A nearest neighbor table, as produced by \code{\link{nearestNeighbors}}.}

\item{k}{Minimum number of nearest neighbors two rows (items) in the nearest neighbor 
table need to have in common to join them into the same cluster.}

\item{mode}{If \code{mode = "a1a2b"} (default), the clustering is run with both 
requirements (a) and (b); if \code{mode = "a1b"} then (a) is relaxed 
to a unidirectional requirement; and if \code{mode = "b"} then only
requirement (b) is used. The size of the clusters generated by the different 
methods increases in this order: "a1a2b" < "a1b" < "b". The run time of 
method "a1a2b" follows a close to linear relationship, while it is nearly
quadratic for the much more exhaustive method "b". Only methods "a1a2b" and 
"a1b" are suitable for clustering very large data sets (e.g. >50,000 items) 
in a reasonable amount of time.}

\item{linkage}{Can be one of "single", "average", or "complete", for single linkage, 
average linkage and complete linkage merge requirements, respectively. 
In the context of Jarvis-Patrick, average linkage means that at least half 
of the pairs between the clusters under consideration must pass the merge 
requirement. Similarly, for complete linkage, all pairs must pass the merge 
requirement. Single linkage is the normal case for Jarvis-Patrick and just 
means that at least one pair must meet the requirement.}
}
\value{
Depending on the setting under the type argument, the function returns the clustering 
        result in a named vector or a nearest neighbor table as matrix.
}
\description{
Jarvis-Patrick Clustering
}
\details{
Function to perform Jarvis-Patrick clustering. The algorithm requires a nearest 
neighbor table, which consists of neighbors for each item in the dataset. This 
information is then used to join items into clusters with the following 
requirements: (a) they are contained in each other's neighbor list (b) they share
at least k nearest neighbors The nearest neighbor table can be computed with 
\code{\link{NNeighbors}}. For standard Jarvis-Patrick clustering, this function 
takes the number of neighbors to keep for each item.
}
\examples{
data(sdfbcl)
apbcl <- convSDFtoAP(sdfbcl)
fpbcl <- convAPtoFP(apbcl)
clusterJP(NNeighbors(apbcl, numNbrs = 6), k = 5, mode = "a1a2b")
clusterJP(NNeighbors(fpbcl, numNbrs = 6), k = 5, mode = "a1b")
clusterJP(NNeighbors(apbcl, cutoff = 0.6), k = 2, mode = 'b')

}
\references{
Jarvis RA, Patrick EA (1973) 
Clustering Using a Similarity Measure Based on Shared Near Neighbors. IEEE
Transactions on Computers, C22, 1025-1034. URLs: http://davide.eynard.it/teaching/2012_PAMI/JP.pdf,
http://www.btluke.com/jpclust.html, 
http://www.daylight.com/dayhtml/doc/cluster/index.pdf
}
\seealso{
see \code{\link{NNeighbors}} for nearest neighbors
}
\author{
Min-feng Zhu <\email{wind2zhu@163.com}>
}
\keyword{clusterJP}
