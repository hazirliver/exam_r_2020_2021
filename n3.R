if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')

t.stat <- t.test(ToothGrowth$len[ToothGrowth$supp == "OJ" & ToothGrowth$dose == 1], 
                 ToothGrowth$len[ToothGrowth$supp == "VC" & ToothGrowth$dose == 2])$statistic
t.pval <- t.test(ToothGrowth$len[ToothGrowth$supp == "OJ" & ToothGrowth$dose == 1], 
                 ToothGrowth$len[ToothGrowth$supp == "VC" & ToothGrowth$dose == 2])$p.value

## 0.09 > 0.05 => нет оснований отвергать нулевую гипотезу о равенстве средних
##                на основании t-теста на уровне значимости 0.05 => 
##             => нет оснований полагать, что длина зубов зависит от того,
##                что потребляли морские свинки

ggplot(ToothGrowth, aes(as.factor(dose), len, fill=supp)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ supp)


####################################


fit <- aov(PlantGrowth$weight ~ PlantGrowth$group, PlantGrowth)
summary(fit)

## p-value для F-Значения 0.0159 < 0.0500 => есть основания отвергнуть нулевую гипотезу об отсутствии различий
## в урожанойсти (вес) между группами удобрений

boxplot(PlantGrowth$weight ~ PlantGrowth$group,
        xlab = "Удобрения", ylab = "Урожайность (вес)", 
        main = "Зависимости урожайности от удобрения")

ggplot(PlantGrowth, aes(weight, fill = group)) + geom_density(alpha = 0.5)


####################################



