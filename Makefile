SRC = $(basename $(wildcard *.dot))
FORMATS = png pdf svg
DOT = dot

define dot =
$(DOT) -T$(subst .,,$(suffix $@)) $^ > $@
endef

%.png: %.dot
	$(dot)

%.svg: %.dot
	$(dot)

%.pdf: %.dot
	$(dot)

all: $(foreach fmt,$(FORMATS),$(addsuffix .$(fmt),$(SRC)))

.PHONY: clean
clean:
	rm $(addprefix *., $(FORMATS))
