\name{normalizePhospho}
\alias{normalizePhospho}
\title{Pairwise Normalization of MS-based phosphoproteomic data}
\usage{
normalizePhospho(enriched, non.enriched, phospho = NULL, 
samplesCols, modseqCols, techRep, plot.fc=NULL)
}
\arguments{

    \item{enriched}{The enriched data with the type data.frame or MSnSet, which should
    contain the sequence, modification of the sequence with their phosphorylation 
    site and their abundanecs across samples}
    
    \item{non.enriched}{The non-enriched data with the type data.frame or MSnSet, which should
    contain the sequence, modification of the sequence with their phosphorylation 
    site and their abundanecs across samples}
    
    \item{phospho}{a string that shows the term that represents phosphorylation in the 
    modification column of the data. If it is not assigned, "Phospho" will be used as 
    the default value}
    
    \item{samplesCols}{A data.frame with two columns, with the column names enriched and non.enriched, 
    of type numeric or integer, which must contain the column number of samples that hold the abundances}
    
    \item{modseqCols}{A data.frame with two columns, with the names enriched and non.enriched, 
    of type numeric or integer, which must contain the column number of samples that hold the sequence 
    and modifications of the peptides}
    
    \item{techRep}{a factor that holds information about columns order and the technical
    replicates of the samples}
	
	\item{plot.fc}{This parameter if set plots the fold change distribution before and after pairwise normalization. controls and samples should be set as named vectors in a list (look at the example)}
}
\value{
    A data.frame with the normalized values and their sequence and modification.
}
\author{
Sohrab Saraei, Tomi Suomi, Otto Kauko,Laura L. Elo 

Maintainer: Sohrab Saraei <sohrab.saraei@utu.fi>
}
\description{
    This function compensates for the bias introduced in global 
    phosphorylation in the sample after using median normalization.
}
\details{
    It is shown that global median normalization can introduce bias in the fold change of global phosphorylation between samples. 
    It is suggested that by taking the non-enriched data into consideration, this bias could be compensated (Kauko et al. 2015).
}
\examples{
    #Specifying the column numbers of abundances in the original data.frame, 
    #from both enriched and non-enriched runs
    samplesCols <- data.frame(enriched=3:17, non.enriched=3:17)
    #Specifying the column numbers of sequence and modification in the original data.frame, 
    #from both enriched and non-enriched runs
    modseqCols <- data.frame(enriched = 1:2, non.enriched = 1:2)
    #The samples and their technical replicates
    techRep <- factor(x = c(1,1,1,2,2,2,3,3,3,4,4,4,5,5,5))
    #Call the function
    norm <- normalizePhospho(enriched = enriched.rd, non.enriched = non.enriched.rd, 
            samplesCols = samplesCols, modseqCols = modseqCols, techRep = techRep, 
			plot.fc = list(control = c(1,2), samples = c(3,4,5)))
    head(norm)
}
\references{
    \url{http://www.nature.com/articles/srep13099}
}
\seealso{
    \href{https://bioconductor.org/packages/release/bioc/html/MSnbase.html}{MSnbase}
}
\keyword{Mass-spectrometry}
\keyword{Normalization,}
\keyword{Phosphoproteomics,}

