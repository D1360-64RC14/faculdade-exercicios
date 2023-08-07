package presentation

import (
	"bytes"
	"fmt"
	"strings"
)

type LineType int

const (
	LINE_TEXT       = LineType(iota)
	LINE_DECORATION = LineType(iota)
)

type Line struct {
	Content string
	Type    LineType
}

type Presentation struct {
	lines          []Line
	decorationChar rune
	sidePadding    int
}

func New(decoration rune, sidePadding int, lines []Line) *Presentation {
	return &Presentation{
		lines,
		decoration,
		sidePadding,
	}
}

func NewEmpty(decoration rune, sidePadding int) *Presentation {
	return &Presentation{
		make([]Line, 0),
		decoration,
		sidePadding,
	}
}

func (p *Presentation) PushText(line string) {
	p.lines = append(p.lines, Line{line, LINE_TEXT})
}

func (p *Presentation) PushDecoration() {
	p.lines = append(p.lines, Line{"", LINE_DECORATION})
}

func (p *Presentation) String() string {
	var outBuffer bytes.Buffer

	biggestLine := 0
	for _, line := range p.lines {
		if line.Type == LINE_TEXT && len(line.Content) > biggestLine {
			biggestLine = len(line.Content)
		}
	}

	lineSize := biggestLine + p.sidePadding*2

	outBuffer.WriteString(strings.Repeat(string(p.decorationChar), lineSize))
	outBuffer.WriteRune('\n')
	for _, line := range p.lines {
		switch line.Type {
		case LINE_TEXT:
			linePaddingSize := (lineSize - len(line.Content)) / 2
			outBuffer.WriteString(strings.Repeat(" ", linePaddingSize) + line.Content)
		case LINE_DECORATION:
			outBuffer.WriteString(strings.Repeat(string(p.decorationChar), lineSize))
		}
		outBuffer.WriteRune('\n')
	}
	outBuffer.WriteString(strings.Repeat(string(p.decorationChar), lineSize))
	outBuffer.WriteRune('\n')

	return outBuffer.String()
}

func (p *Presentation) Println() {
	fmt.Println(p.String())
}

func Text(content string) Line {
	return Line{content, LINE_TEXT}
}

func Decoration() Line {
	return Line{"", LINE_DECORATION}
}
