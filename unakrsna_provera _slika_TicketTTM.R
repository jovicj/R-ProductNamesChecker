

library(stringr)
listaproizvoda <- read.csv("D:/www.lola-haengematten.de/10-10-2018/Products_import/listaproizvoda.csv",
                           sep="", stringsAsFactors=FALSE)
spisakslika <- list.files(path = "d:/Google drive/VISUALS/",
                          pattern = NULL, recursive = TRUE, all.files = TRUE,)

#NEVEROVATNO DOBAR NACIN DA SE UKRSTE IMENA FAJLOVA sa stringovima unutar imena
matches <- outer(setNames(nm = spisakslika), setNames(nm = PRODUCTS_MODEL), str_count)
matches_t <- t(matches)

#vektor broja fotografija po proizvodu - sumirane kolone
slika_po_proizvodu <- colSums(matches)

#
write(slika_po_proizvodu, file = "Broj slike po proizvodu", ncolumns = 1, sep = "\t")
listaproizvoda$count <- slika_po_proizvodu
write(listaproizvoda, file = "Broj slika po proizvodu.csv", sep = "\t")