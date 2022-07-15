require (cna)
library(frscore)
?d.pban
d.pban
mvcna(d.pban)
df<-d.pban
robust<-frscored_cna(df, fit.range = c(0.95, 0.75), granularity = 0.05, type="mv", inus.only=T, )
robust
mvcna(df,con=0.9,cov=0.9,ordering=list("c","PB"))
mvcna(df,con=0.9,cov=0.9,ordering=list("T","PB"))

#Fazendo a análise de coincidência do pban não foi encontrado nenhum resultado
#Como não havia resultado com con e cov igual a 1, fiz a análise de robustez
#Com a análise, percebeu-se que a configuração com maior score era C=1=T=2<->PB=1
#que quer dizer que países africanos com colonização francesa e com transição 
#gerenciada têm proibição de recursos.Assim, foi descobert qual outcome
#deve-se solicitar a análise de CNA.Para fazer novamente a análise CNA,
#foi colocado con=0.9 e cov =0.9, e ordering ("C","PB") e ("T","PB"), foi
#alcançado alguns resultados com o outcome PB, inclusive o resultado com 
#maior robustez de todos os outcomes, mencionado nesse texto